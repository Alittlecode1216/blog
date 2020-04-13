# coding: utf-8
"""
__project_ = 'blog'
__file_name__ = 'tasks'
__author__ = 'admin'
__time__ = '2020-04-13 11:20'
__product_name = PyCharm
"""
import platform

from celery import shared_task
import re
import json
# 词频统计库
import collections
import numpy as np
import jieba
import wordcloud
from PIL import Image

from blog.settings import STATICFILES_DIRS, WINDOWS_FONT_PATH, UBUNTU_FONT_PATH
from storm.models import Article


@shared_task
def word_cloud_handle():
    """
    生成词云
    :param :
    :return:
    """
    print("---开始生成词云---")
    article_content = Article.objects.all().values_list('body', flat=True)
    # 转化为字符串
    article_content_str = json.dumps(list(article_content), ensure_ascii=False)
    # 文本预处理
    # pattern_char = re.compile(u'\t|\n|\.|-|:|;|\)|\(|\?|"')  # 定义正则表达式匹配模式

    # 正则匹配中文
    pattern = re.compile(r'[\u4e00-\u9fa5]+')
    string_data = pattern.findall(article_content_str)
    string_data = json.dumps(string_data, ensure_ascii=False)
    # string_data = re.sub(pattern, '', string_data)  # 将符合模式的字符去除
    # 文本分词
    seg_list_exact = jieba.cut(string_data, cut_all=False)  # 精确模式分词
    object_list = []
    remove_words = [u'的', u'，', u'和', u'是', u'随着', u'对于', u'对', u'等', u'能', u'都', u'。', u' ', u'、', u'中', u'在', u'了',
                    u'通常', u'如果', u'我们', u'需要', u'你', u'"', u'[', u']', u',']  # 自定义去除词库
    # 循环读出每个分词，如果不在去除词库中，分词追加到列表
    for word in seg_list_exact:
        if word not in remove_words:
            object_list.append(word)

    # 词频统计
    word_counts = collections.Counter(object_list)
    # word_counts_top10 = word_counts.most_common(100)  # 获取前10最高频的词
    # print(word_counts_top10)  # 输出检查

    # 判断系统环境，字体文件
    platform_ = platform.system()
    if platform_ == "Windows":
        font_path = WINDOWS_FONT_PATH
    elif platform_ == "Linux":
        font_path = UBUNTU_FONT_PATH
    elif platform_ == "Mac":
        font_path = ''

    # 词频展示
    mask = np.array(Image.open(STATICFILES_DIRS[0] + '/wordcloud.jpg'))  # 定义词频背景
    wc = wordcloud.WordCloud(
        font_path=font_path,  # 设置字体格式
        mask=mask,  # 设置背景图
        max_words=1000,  # 最多显示词数
        max_font_size=40,  # 字体最大值
        height=500,
    )
    # 从字典生成词云
    wc.generate_from_frequencies(word_counts)
    # 从背景图建立颜色方案
    image_colors = wordcloud.ImageColorGenerator(mask)
    # 将词云颜色设置为背景图方案
    wc.recolor(color_func=image_colors)
    # 保存图片
    wc.to_file(STATICFILES_DIRS[0] + "/pywordcloud.png")
    print("---生成词云完成---")
