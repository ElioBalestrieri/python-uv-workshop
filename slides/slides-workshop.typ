// Get Polylux from the official package repository
#import "@preview/polylux:0.4.0": *
#import "@preview/ez-today:2.1.0"
#import "@preview/fontawesome:0.6.2": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *

// defaults
#show link: set text(blue)
#show link: underline

// initialize codly and set defaults
#show: codly-init.with()
#codly(
  languages: codly-languages,
  number-format: none,
)

// Make the paper dimensions fit for a presentation and the text larger
#set page(paper: "presentation-4-3")
#set text(size: 20pt, font: "Open Sans")

// Use #slide to create a slide and style it using your favourite Typst functions
#slide[
  = Modern Python Project Management for Researchers with `uv`.

  #place(horizon, dy : -15%)[
    _Elio Balestrieri_

    #ez-today.today()
  ]

  #place(right + bottom, dy: -15%)[
    #figure(
        image("assets/uni-ms-logo.svg",
          width: 40%)
    )
  ]
  #place(right + bottom, dy: 10%)[
    #figure(
        image("assets/hpc-nrw-logo.svg",
          width: 43%)
    )
  ]
  #place(left + bottom, dy: 5%)[
    #figure(
        image("assets/drainbow.png",
          width: 25%)
    )
  ]
]

#slide[
  == Who am I

  #set align(horizon)
  - Born in Genoa 🇮🇹
  - Grew up in San Marino 🇸🇲
  - PhD & Postdoc in Neuroscience 🧠 at University of Münster 🇩🇪
  - HPC System Admin 🤖 at University of Münster
  \
  #uncover(2)[
  Enthusiastic about many things... Relevant here: *good*, *open* *scientific software* and *reproducibility* of scientific workflows.
  ]
]

#slide[
  == Who are you?

  #set align(horizon)
  #uncover(2)[Scientist 🧑‍🔬]\
  #uncover(3)[Developer/System Administrator 🧑‍💻]\
  #uncover(4)[Curious 🧙]\


]



#slide[
  == What is `uv`?

  #set align(horizon)
  An extremely fast package and project manager, written in Rust

]

#slide[
  == 🤔 And why should I care?

  #uncover(2)[
    #set align(horizon)
    - Extremely fast
    - Very versatile for both new and existing projects
    - It feels like "this is how it was supposed to be done"
  ]
]

#slide[
  == OK, where's the catch?

  #set align(horizon)
  #uncover(2)[
    There is one, depending on your standpoint on Big Tech:

    As of March 19th 2026, *Astral* (the company behind `uv`) *joined OpenAI* #fa-icon("openai")\
    \

    https://astral.sh/blog/openai

  ]
]

#slide[
  == 🤷 Naja, what can we do about it?

  #set align(horizon)
  Not much... Decide whether to use it or not, I guess.
  \ \
  #uncover(2)[
  And if you still want to do that, then let's start!
  \
  ```sh
  git clone https://github.com/ElioBalestrieri/python-uv-workshop.git
  ```
  ]
]

#slide[

  == Installation

  #set align(horizon)
  https://docs.astral.sh/uv/#installation \
  \
  #fa-icon("apple") & #fa-icon("linux"):
  ```sh
  $ curl -LsSf https://astral.sh/uv/install.sh | sh
  ```

  #fa-icon("windows"):
  ```powershell
  PS> powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
  ```
  #emph(text(12pt)[
    *Apologetic note*: I have stopped using windows back in 2010 😅
  ])

  \
  #uncover(2)[How is everybody doing?]
]

#slide[
  == About virtual environments

  #set align(horizon)
  By ✋: How many of you are familiar with the concept of virtual environment?
]

#slide[
  == A virtual environment is:

  #set align(horizon)
  - Contained in a directory (e.g. `.venv`), and consists of a specific Python interpreter and software libraries and binaries which are needed to support a project.
  - *Isolated* from *other virtual environments* and Python interpreters and libraries installed system-wide.
  - *Not* checked into source control systems such as *Git*.
  - Considered as *disposable*.
  - *Not* considered as *movable* or *copyable*.
]

#slide[
  == `uv venv / pip`

  #set align(horizon)
  You can create a new environment, with a specific python version as follows:
  ```sh
  uv venv --python 3.13 my-test-venv
  ```
  \
  Defaults:
  - no virtual env name #fa-icon("circle-right") `.venv`
  - if python version unavailable #fa-icon("circle-right") `uv` downloads it for you
  - no python version specified #fa-icon("circle-right") system default
]

#slide[
  == `uv venv / pip`

  #set align(horizon)
  You can activate the new environment as follows:

  \
  \

  #fa-icon("apple") & #fa-icon("linux"):
  ```sh
  source .venv/bin/activate
  ```

  #fa-icon("windows"):
  ```powershell
  .venv\Scripts\activate
  ```
]

#slide[
  == `uv venv / pip`

  #set align(horizon)
  You can install new packages in your environment using pip:

  ```sh
  uv pip install numpy pandas
  ```

  #uncover(2)[
    And you can deactivate the virtual environment with:
    ```sh
    deactivate
    ```
  ]
]

#slide[
  == `uv venv / pip`

  #set align(horizon)
  To summarize:

  ```sh
  uv venv --python 3.13 my-test-venv
  source my-test-venv/bin/activate
  uv pip install numpy pandas
  deactivate
  ```
]

#slide[
  == Your turn 🫵

  #set align(horizon)
  Create a virtual environment with `uv venv` and install your favorite packages with `uv pip`

  Stuck? Check:
  https://docs.astral.sh/uv/pip/
]

#slide[
  == 🆒😒 Why do we even need `uv` for this?
  #set align(horizon)
  Is this really only about having a fast `pip`?
]


#slide[
  == Projects in `uv`

  #set align(horizon)
  `uv` allows the creation of Python projects as organized development environments... Quite in a smooth way:

  ```sh
  uv init my-amazing-project
  cd my-amazing project
  ```

  or, alternatively:

  ```sh
  mkdir my-amazing-project
  cd my-amazing project
  init
  ```
]

#slide[
  == Projects in `uv`

  #set align(horizon)
  Already some interesting things:
  - by default under version control with #fa-icon("git")
  - `pyproject.toml` #fa-icon("circle-left") metadata and dependencies.

]


#slide[
  == Projects in `uv`

  #set align(horizon)
  ```sh
  uv run main.py
  ```
  Adds some items in the project:
  \

  - `.venv/`
  - `uv.lock` #fa-icon("circle-right") a cross platform lockfile containing the exact info about your project dependencies. *Do not edit*
]


#slide[
  == Projects in `uv`

  #set align(horizon)
  To add new dependencies:
  ```sh
  uv add numpy
  ```
  Or alternatively, edit the dependencies list of `pyproject.toml` and run:
  ```sh
  uv run main.py
  ```
]

#slide[
  == Projects in `uv`

  #set align(horizon)
  `uv add` is also compatible with requirements.txt
  ```sh
  uv add -r requirements.txt
  ```
]


#slide[
  == Projects in `uv`

  #set align(horizon)
  🧓 _when I was young I was simply executing my scripts with python_

  OK, fine. Edit your `pyproject.toml` and then:
  ```sh
  uv sync
  source .venv/bin/activate
  python main.py
  ```
]

#slide[
  == Your turn 🫵

  #set align(horizon)
  - create a new project
  - migrate the dependencies from an old project \ 💡 `pip freeze > requirements.txt`
  - test whether the imports work

  Help yourself with these slides or:

  https://docs.astral.sh/uv/guides/projects/#managing-dependencies

  \
  #uncover(2)[
    🔄 *alternatively,* if you don't have a project to work with:

    `python-uv-workshop/exercises/migrate-project`
  ]
]

#slide[
  == Shipping your project

  #set align(horizon)
  It can be as immediate #footnote[if you don't have #fa-icon("c") code 😇] as:

  ```sh
  uv build
  uv publish --token pypi-SeCR3tT0K3N --publish-url https://test.pypi.org/legacy/
  ```
  For testing your upload on test-pypi. You can even omit the `--publish-url` when you are ready to publish to PyPI.
]


#slide[
  == Single executable scripts

  #set align(horizon)
  Although it is _preferable_ to work within a project, you can also declare dependencies as *inline metadata* and run the script as a standalone.
  \
  \
  For example:
  ```sh
  uv init --script my-standalone-script.py --python 3.13
  uv add --script my-standalone-script.py 'numpy' 'pandas' 'matplotlib'
  ```

]

#slide[
  == Your turn 🫵

  #set align(horizon)
  *Scenario* \
  You have one python script that does not require a whole project by itself, and you want to send it around as a standalone.
  \
  \
  How can you do that with `uv`?
  \
  \
  🔄 *alternatively,* you can create a standalone script from `analysis.py` in `python-uv-workshop/exercises/migrate-project`.

  Stuck? Check:
  https://docs.astral.sh/uv/guides/scripts/#declaring-script-dependencies
]


#slide[
  == Useful links

  #set align(horizon)
  https://docs.astral.sh/uv/
  \
  https://pydevtools.com/
  \
  https://www.reddit.com/r/learnpython/comments/1bmxe6i/whats_the_difference_between_pyprojecttoml/

]

#slide[
  ==

  #set align(horizon)
  *_Fin._*
]

#slide[
  == _Excursus:_ `pyproject.toml` vs `requirements.txt`

  #set align(horizon)
  https://pydevtools.com/handbook/explanation/pyproject-vs-requirements/

  `requirements.txt` lists packages to install. `pyproject.toml` defines a project. That distinction shapes how dependencies get managed and how projects scale.

  Moreover `requirements.txt` has some gaps:
  - It demands manual coordination (`pip-compile` or `pip freeze`)
  - No Python version constraint.
  - No project metadata.
]


#slide[
  == _Excursus:_ `uv tools`

  #set align(horizon)
  Seem cool, but tbh I have never used them \
  https://docs.astral.sh/uv/guides/tools/

]
