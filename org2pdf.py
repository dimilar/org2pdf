#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# copyright @ 2014 Stift
#
import subprocess, sys
import argparse
import os
class OrgExport(object):
    """
    Generate pdf file using xelatex + org-mode
    """

    def __init__(self, args):
        """
        conf: org-mode's configuration file
        func: specify the function to export the given file, e.g. org-latex-export-as-latex
        org_file: input org-mode file
        """
        self.org_file = args.org_file
        if args.function == None:
            self.func = 'org-latex-export-to-latex'            
        else:
            self.func = args.function            
        if args.output == None:
            self.out = self.org_file.replace('.org', '.tex')            
        else:
            self.out = args.output            
        
    def execute(self):
        """
        call emacs to export the org-mode file to specified type of file
        """
        # cmd = "emacs --batch --no-site-file --load %s --visit %s --funcall %s" %(self.conf, self.org_file, self.func)
        cmd = 'emacsclient --eval "(save-excursion (let ((buffer (find-file-literally \\"%s\\")) backend) (setq make-backup-files nil) (with-current-buffer buffer (re-search-forward \\"#\\\\\\\\+LATEX_CLASS: *\\\\\\\\([^ |^\\n|^\\t|^\\r]*\\\\\\\\)\\" nil t) (if (string=  (downcase (match-string 1)) \\"beamer\\") (setq backend \'beamer) (setq backend \'latex)) (org-export-to-file backend \\"%s\\") (kill-buffer))))"' %(self.org_file, self.out)
        subprocess.call(cmd, shell=True)
        # if ret == 0:
        #     stdout.write("Success:)\n")
        # else:
        #     stdout.write("Fail!!\n")
            

def pdf_export():
    parser = argparse.ArgumentParser(
        description="This is a description of %(prog)s", epilog="s", prefix_chars="-+",
        fromfile_prefix_chars="@", formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument("-f", "--function", help="functionl", type=str)
    parser.add_argument("-c", "--conf", help="org-mode configuration file", type=str)
    parser.add_argument("-o", "--output", help="output file", type=str)
    parser.add_argument("org_file", action='store', help="org file", type=str)
    args = parser.parse_args(sys.argv[1:])
    print args
    # if args.output == None:
    #     args.output = os.path.join(os.getcwd(), '')
    obj = OrgExport(args)
    obj.execute()
    
if __name__ == '__main__':
    pdf_export()
