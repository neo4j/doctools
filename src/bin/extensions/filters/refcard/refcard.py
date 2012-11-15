#!/usr/bin/env python
# -*- mode: Python; coding: utf-8 -*-

import sys

title = ''
if len(sys.argv) > 1:
  title = sys.argv[1]
first_line = True
blocks = []
block = []
data = sys.stdin.readlines()
for line in data:  
  if len(line.strip()) == 0:
    if not first_line:
      blocks.append(block)
      first_line = True
      block = []
  else:
    block.append(line)
    first_line = False
if len(block) > 0:
  blocks.append(block)

body = []
body.append('<table><tbody>')
if len(title) > 0:
  body.append('<tr>')
  if len(blocks) > 1:
    body.append('<th colspan="2">')
  else:
    body.append('<th>')
  body.append(title)
  body.append('</th></tr>')

for idx, block in enumerate(blocks):
  if idx % 2 == 0:
    body.append('<tr><td><pre class="programlisting brush: cypher">')
    body.extend(block)
    body.append('</pre>')
    if idx == len(blocks) - 1:
      body.append('</td></tr>')
  else:
    body.append('<p>')
    body.extend(block)
    body.append('</p></td></tr>')      

body.append('</tbody></table>')
sys.stdout.write(''.join(body))
