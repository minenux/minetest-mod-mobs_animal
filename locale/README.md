# Convert '.po' file to '.txt' file.

This is only used for older engines.. newer ones uses the plain text files with tr extensions

### COMMAND SAMPLE
''''
$ lua po2tr.lua "Your Name (Your Site) <Your Email>" "pt_BR.po"
rm "pt_BR.tr" "mobs_animal.pt_BR.tr"
$ cat mobs_animal.pt_BR.tr | less
''''

Source Code: https://gitlab.com/4w/xtend/-/blob/master/xtend_default/tools/convert_po_file_to_tr_file/convert_po_file_to_tr_file.lua
