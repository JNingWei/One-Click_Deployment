# -*- coding: utf-8 -*-

import os
import urllib
import logging
import sys


logging.basicConfig(
    format='%(asctime)s %(levelname)s %(message)s',
    level=logging.INFO,
    stream=sys.stdout)

file_path = '../../dir_name/file_name'

if not os.path.isfile(file_path):
    logging.info("File doesn't exist.")
    url = '安装文件的资源地址。。。（还没来得及上传→_→，So sorry）'
    file_dir = file_path[:-9]
    if not os.path.exists(file_dir):
        logging.info("Mkdir 'Required installation files/'.")
        os.mkdir(file_dir)

    def down(_save_path, _url):
        try:
            urllib.urlretrieve(_url, _save_path)
        except:
            print '\nError when retrieving the URL:', _save_path

    logging.info("Downloading file.")
    down(file_path, url)
else:
    logging.info("File exists.")
