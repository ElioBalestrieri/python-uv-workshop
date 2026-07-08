// Get Polylux from the official package repository
#import "@preview/polylux:0.4.0": *
#import "@preview/ez-today:2.1.0"
#import "@preview/fontawesome:0.6.2": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *

// initialize codly and set defaults
#show: codly-init.with()
#codly(
  languages: codly-languages,
  number-format: none,
)

// Make the paper dimensions fit for a presentation and the text larger
#set page(paper: "presentation-4-3")
#set text(size: 20pt, font: "DejaVu Sans Mono")

// Use #slide to create a slide and style it using your favourite Typst functions
#slide[
  = Modern Python Project Management for Researchers with `uv`.

  #set align(horizon)
  _Elio Balestrieri_

  #ez-today.today()

]

#slide[
  == What is `uv`?

  #set align(horizon)
  An extremely fast package and project manager, written in Rust

]

#slide[
  == 🤔 And why should I care?

  #set align(horizon)
  - Extremely fast
  - Very versatile for both new and existing projects
  - It feels like "this is how it was supposed to be done"

]

#slide[
  == OK, where's the catch?

  #set align(horizon)
  #uncover(2)[
    There is one, depending on your standpoint on Big Tech:

    As of March 19th 2026, *Astral* (the company behind `uv`) *joined OpenAI* \
    https://astral.sh/blog/openai

  ]

]

#slide[
  == 🤷 Naja, what can we do about it?

  #set align(horizon)
  Not much... Decide whether to use it or not, I guess. And if you still want to do that, then let's start!

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

  \
  #uncover(2)[
    🆒😒 Why do we even need `uv` for this?

    Is this really only about having a fast `pip`?
  ]

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

]

#slide[
  == Single executable scripts

  #set align(horizon)
  todo

  https://docs.astral.sh/uv/guides/scripts/#running-a-script-with-dependencies

  ideas:
  - create in this repo an example script with the preamble already

]


#slide[
  == uv tools

  #set align(horizon)
  todo ?

]


#slide[
  == uv build

  #set align(horizon)
  todo ?

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
  == This slide changes!

  You can always see this.
  // Make use of features like #uncover, #only, and others to create dynamic content
  #uncover(2)[But this appears later!]
]
