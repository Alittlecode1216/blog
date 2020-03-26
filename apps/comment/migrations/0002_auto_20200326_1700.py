# -*- coding: utf-8 -*-
# Generated by Django 1.11.12 on 2020-03-26 17:00
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('comment', '0001_initial'),
        ('storm', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='articlecomment',
            name='belong',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='article_comments', to='storm.Article', verbose_name='所属文章'),
        ),
        migrations.AddField(
            model_name='articlecomment',
            name='parent',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='articlecomment_child_comments', to='comment.ArticleComment', verbose_name='父评论'),
        ),
        migrations.AddField(
            model_name='articlecomment',
            name='rep_to',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='articlecomment_rep_comments', to='comment.ArticleComment', verbose_name='回复'),
        ),
        migrations.AddField(
            model_name='aboutcomment',
            name='author',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='aboutcomment_related', to='comment.CommentUser', verbose_name='评论人'),
        ),
        migrations.AddField(
            model_name='aboutcomment',
            name='parent',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='aboutcomment_child_comments', to='comment.AboutComment', verbose_name='父评论'),
        ),
        migrations.AddField(
            model_name='aboutcomment',
            name='rep_to',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='aboutcomment_rep_comments', to='comment.AboutComment', verbose_name='回复'),
        ),
    ]
