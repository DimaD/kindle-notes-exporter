# Kindle notes exporter


## Overview

Command line tool to export quotes and notes from kindle clippings file to HTML. It is useful if you read a lot of books not purchased on Amazon and want to access this data on your computer

## Usage

1. clone repository with `https://github.com/DimaD/kindle-notes-exporter.git`
2. Install ruby gem bundler with `gem install bundler`
3. `cd` into `kindle-notes-exporter`
4. Run `bundle install`
5. Run exporter with `bundle exec ruby bin/generate-clippings-library.rb path-to-clippings-file-from-kindle.txt path/to/output/directory`
