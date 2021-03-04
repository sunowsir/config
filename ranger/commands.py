# This is a sample commands.py.  You can add your own commands here.
#
# Please refer to commands_full.py for all the default commands and a complete
# documentation.  Do NOT add them all here, or you may end up with defunct
# commands when upgrading ranger.

# A simple command for demonstration purposes follows.
# -----------------------------------------------------------------------------

from __future__ import (absolute_import, division, print_function)
from ranger.core.loader import CommandLoader

# You can import any python module as needed.
import os

# You always need to import ranger.api.commands here to get the Command class:
from ranger.api.commands import Command


# Any class that is a subclass of "Command" will be integrated into ranger as a
# command.  Try typing ":my_edit<ENTER>" in ranger!
# class my_edit(Command):
#     # The so-called doc-string of the class will be visible in the built-in
#     # help that is accessible by typing "?c" inside ranger.
#     """:my_edit <filename>
#
#     A sample command for demonstration purposes that opens a file in an editor.
#     """
#
#     # The execute method is called when you run this command in ranger.
#     def execute(self):
#         # self.arg(1) is the first (space-separated) argument to the function.
#         # This way you can write ":my_edit somefilename<ENTER>".
#         if self.arg(1):
#             # self.rest(1) contains self.arg(1) and everything that follows
#             target_filename = self.rest(1)
#         else:
#             # self.fm is a ranger.core.filemanager.FileManager object and gives
#             # you access to internals of ranger.
#             # self.fm.thisfile is a ranger.container.file.File object and is a
#             # reference to the currently selected file.
#             target_filename = self.fm.thisfile.path
#
#         # This is a generic function to print text in ranger.
#         self.fm.notify("Let's edit the file " + target_filename + "!")
#
#         # Using bad=True in fm.notify allows you to print error messages:
#         if not os.path.exists(target_filename):
#             self.fm.notify("The given file does not exist!", bad=True)
#             return
#
#         # This executes a function from ranger.core.acitons, a module with a
#         # variety of subroutines that can help you construct commands.
#         # Check out the source, or run "pydoc ranger.core.actions" for a list.
#         self.fm.edit_file(target_filename)
#
#     # The tab method is called when you press tab, and should return a list of
#     # suggestions that the user will tab through.
#     # tabnum is 1 for <TAB> and -1 for <S-TAB> by default
#     def tab(self, tabnum):
#         # This is a generic tab-completion function that iterates through the
#         # content of the current directory.
#         return self._tab_directory_content()

class extract(Command):
    """:extract <paths>
    Extract archives
    """

    def execute(self):
        import os
        fail = []
        for i in self.fm.thistab.get_selection():
            ExtractProg = '7z x'
            if i.path.endswith('.zip'):
                # zip encoding issue
                # 如果压缩包格式尾zip，zip解压会出现编码问题，
                # 因此进行微小调整，采用如下逻辑进行解压
                ExtractProg = 'unzip'
                if os.system('{0} "{1}"'.format(ExtractProg, i.path)):
                    if os.system('{0} "-O" "cp936" "{1}"'.format(ExtractProg, i.path)):
                        fail.append(i.path)
            else:
                if i.path.endswith('.tar.gz'):
                    ExtractProg = 'tar xvf'
                elif i.path.endswith('.tar.xz'):
                    ExtractProg = 'tar xJvf'
                elif i.path.endswith('.tar.bz2'):
                    ExtractProg = 'tar xjvf'
                if os.system('{0} "-O" "cp936" "{1}"'.format(ExtractProg, i.path)):
                    fail.append(i.path)
        if len(fail) > 0:
            self.fm.notify("Fail to extract: {0}".format(
                ' '.join(fail)), duration=10, bad=True)
        self.fm.redraw_window()


class compress(Command):
    def execute(self):
        """ Compress marked files to current directory """
        cwd = self.fm.thisdir
        marked_files = cwd.get_selection()

        if not marked_files:
            return

        def refresh(_):
            cwd = self.fm.get_directory(original_path)
            cwd.load_content()

        original_path = cwd.path
        parts = self.line.split()
        au_flags = parts[1:]

        descr = "compressing files in: " + os.path.basename(parts[1])
        obj = CommandLoader(args=['apack'] + au_flags +
                            [os.path.relpath(f.path, cwd.path) for f in marked_files], descr=descr)

        obj.signal_bind('after', refresh)
        self.fm.loader.add(obj)

    def tab(self):
        """ Complete with current folder name """

        extension = ['.zip', '.tar.gz', '.rar', '.7z']
        return ['compress ' + os.path.basename(self.fm.thisdir.path) + ext for ext in extension]
