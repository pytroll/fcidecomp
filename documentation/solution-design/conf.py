# Copyright 2021, European Organisation for the Exploitation of Meteorological Satellites (EUMETSAT)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# -*- coding: utf-8 -*-
#
# Configuration file for the Sphinx documentation builder.
#
# This file does only contain a selection of the most common options. For a
# full list see the documentation:
# http://www.sphinx-doc.org/en/master/config

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
#
import os

# import sys
# sys.path.insert(0, os.path.abspath('.'))


# -- Project information -----------------------------------------------------

import re

project = "EUMETSAT FCIDECOMP - Solution design"
copyright = (
    "2021, European Organisation for the Exploitation of Meteorological Satellites (EUMETSAT)"
)
author = "B-Open Solutions srl"

# The full version, including alpha/beta/rc tags.
release = re.sub("^v", "", os.popen("git describe").read().strip())
if "CI_COMMIT_SHORT_SHA" in os.environ:
    release = os.environ.get("CI_COMMIT_SHORT_SHA")
if "CI_COMMIT_TAG" in os.environ:
    release = os.environ.get("CI_COMMIT_TAG")

version = release

# -- General configuration ---------------------------------------------------

# If your documentation needs a minimal Sphinx version, state it here.
#
# needs_sphinx = '1.0'

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = [
    "sphinx.ext.autodoc",
    "sphinx.ext.mathjax",
    "sphinx.ext.ifconfig",
]

# Add any paths that contain templates here, relative to this directory.
templates_path = ["_templates"]

# The suffix(es) of source filenames.
# You can specify multiple suffix as a list of string:
#
# source_suffix = ['.rst', '.md']
source_suffix = ".rst"

# The master toctree document.
master_doc = "index"

# The language for content autogenerated by Sphinx. Refer to documentation
# for a list of supported languages.
#
# This is also used if you do content translation via gettext catalogs.
# Usually you set "language" from the command line for these cases.
language = None

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = ["_build", "Thumbs.db", ".DS_Store"]

# The name of the Pygments (syntax highlighting) style to use.
pygments_style = None

# -- Options for HTML output -------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#
html_theme = "alabaster"

# Theme options are theme-specific and customize the look and feel of a theme
# further.  For a list of options available for each theme, see the
# documentation.
#
html_theme_options = {"font_family": "Barlow", "head_font_family": "Dosis ExtraLight"}

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ["_static"]

# Custom sidebar templates, must be a dictionary that maps document names
# to template names.
#
# The default sidebars (for documents that don't match any pattern) are
# defined by theme itself.  Builtin themes are using these templates by
# default: ``['localtoc.html', 'relations.html', 'sourcelink.html',
# 'searchbox.html']``.
#
# html_sidebars = {}
html_logo = "images/eumetsat.png"

# -- Options for HTMLHelp output ---------------------------------------------

# Output file base name for HTML help builder.
htmlhelp_basename = "user_guidedoc"

# -- Options for LaTeX output ------------------------------------------------

latex_elements = {
    # The paper size ('letterpaper' or 'a4paper').
    #
    # 'papersize': 'letterpaper',
    "papersize": "a4paper",
    "maketitle": r"""
        \pagenumbering{Roman} %%% to avoid page 1 conflict with actual page 1

        \sphinxmaketitle

        \clearpage
        \pagenumbering{roman}
        \listoftables
        \clearpage
        \pagenumbering{arabic}

        """,
    "preamble": r"""
        \usepackage{graphicx}
        \usepackage{background}

        \backgroundsetup{
          scale=1,
          color=black,
          opacity=1,
          angle=0,
          position=current page.north,
          contents={%
          \small\sffamily%
          \begin{minipage}{.22\textwidth}
          \vspace{1.65cm}
          \hspace{-0.175cm}
          \includegraphics[width=\linewidth,height=70pt,keepaspectratio]{../../images/eumetsat.png}
          \end{minipage}%
          \begin{minipage}{.8\textwidth}
          \vspace{2cm}
          \parbox[b]{.6\textwidth}{}\hfill \\
          \end{minipage}%
          }
        }

        \usepackage{fancyhdr}
        \pagestyle{fancy}
        \fancypagestyle{normal}{%
        \fancyhead{}
        \fancyhead[RE,RO]{\bf{documentation/solution-design \\ v.version, \today \\ EUMETSAT WP FCIDECOMP - Solution design}}
        \renewcommand{\headrulewidth}{0.5pt}
        \fancyfoot{}
        \fancyfoot[C]{\thepage}
        }
        \fancypagestyle{plain}{%
        \fancyhead{}
        \fancyhead[RE,RO]{\bf{documentation/solution-design \\ v.version, \today \\ EUMETSAT WP FCIDECOMP - Solution design}}
        \fancyfoot[CO,CE]{\thepage}
        }

        """.replace("version", version),
}

# Grouping the document tree into LaTeX files. List of tuples
# (source start file, target name, title,
#  author, documentclass [howto, manual, or own class]).
latex_documents = [
    (
        master_doc,
        "fcidecomp-solution-design.tex",
        "EUMETSAT WP FCIDECOMP - Solution design",
        "EUMETSAT",
        "manual",
    ),
]

# -- Options for manual page output ------------------------------------------

# One entry per manual page. List of tuples
# (source start file, name, description, authors, manual section).
man_pages = [
    (
        master_doc,
        "fcidecomp-solution-design",
        "EUMETSAT WP FCIDECOMP - Solution design",
        [author],
        1,
    )
]

# -- Options for Texinfo output ----------------------------------------------

# Grouping the document tree into Texinfo files. List of tuples
# (source start file, target name, title, author,
#  dir menu entry, description, category)
texinfo_documents = [
    (
        master_doc,
        "fcidecomp-solution-design",
        "EUMETSAT WP FCIDECOMP - Solution design",
        author,
        "fcidecomp-solution-design",
        "One line description of project.",
        "Miscellaneous",
    ),
]

# -- Options for Epub output -------------------------------------------------

# Bibliographic Dublin Core info.
epub_title = project

# The unique identifier of the text. This can be a ISBN number
# or the project homepage.
#
# epub_identifier = ''

# A unique identification for the text.
#
# epub_uid = ''

# A list of files that should not be packed into the epub file.
epub_exclude_files = ["search.html"]

numfig = True


# -- Extension configuration -------------------------------------------------
def setup(app):
    app.add_css_file("custom.css")
