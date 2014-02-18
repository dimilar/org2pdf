#!/usr/bin/env python
# -*- coding: utf-8 -*-
import subprocess, sys, getopt
from sys import stdout
class OrgExport(object):
    """
    Generate pdf file using xelatex + org-mode
    """

    def __init__(self, conf, func, org_file):
        """
        conf_dir: the location of org-mode's configuration file
        conf: org-mode's configuration file
        func: specify the function to export the given file, e.g. org-latex-export-as-latex
        org_file: input org-mode file
        """
        self.conf = conf
        self.org_file = org_file
        self.func = func
        
    def execute(self):
        """
        call emacs to export the org-mode file to specified type of file
        """
        # cmd = "emacs --batch --no-site-file --load=%s --visit=%s --funcall %s %s" %(self.conf, self.in_file, self.func, self.org_file)
        cmd = 'emacs --batch --no-site-file --eval \"(progn (setq make-backup-files nil))\" --load=%s --visit=%s --funcall %s %s' %(self.conf, self.org_file, self.func, self.org_file)
        # print cmd
        ret = subprocess.call(cmd, shell=True)
        if ret == 0:
            stdout.write("Success:)\n")
        else:
            stdout.write("Fail!!\n")

def usage():
    print '''
Usage:org2pdf [ options ] org_file
    Options:
    -l init_file  [--conf=init_file]  emacs init file
    -f org_function [--funcall=org_function ] the org function called
       to export pdf files: default value is org-export-as-pdf
    -h [--help] show this message
    -v [--version] version information
        '''
    return 0
            

def pdf_export():
    """
    An example
    """
    func = ''
    conf = ''
    new_argv = []
    for a in sys.argv[1:]:
        new_argv.append(a)
    try:
        # print new_argv
        opts, args = getopt.getopt(new_argv,
                                   "h:f:c:v:",
                                   ["help",
                                    "conf=",
                                    "version",
                                    "output="])
    except getopt.GetoptError:
        usage()
        sys.exit(2)
        
    if len(args) != 1:
        usage()
        sys.exit(3)
        
    for opt, arg in opts:
        if opt in ('-h', '--help'):
            usage()
            sys.exit()
        elif opt in ('-c', '--conf'):
            conf = arg
        elif opt in ('-f', '--funcall'):
            func = arg
        elif opt in ('-v', '--version'):
            print "orgexp 0.99"
            sys.exit(2)
        else:
            usage()
            sys.exit()
            
    org_file = args.pop()
    if func == '':
        func = 'org-latex-export-to-pdf'
    if conf == '':
        conf = './emax_export.el'
    # print org_file
    obj = OrgExport(conf, func, org_file)
    obj.execute()
    
if __name__ == '__main__':
    pdf_export()
