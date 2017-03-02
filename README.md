# Proof Publication Frontend Boilerplate

This is a boilerplate project for creating a [Proof](https://proof.pub)-based
publication frontend compiler using the
[Proof SDK](https://github.com/marquee/static-sdk). Such projects are
compilers, taking in content from the Proof API and generating markup and
assets to be hosted statically, eg on Amazon’s S3.



## Usage

1. Create a folder for the project:

        $ mkdir <project name> && cd <project name>

2. Download the boilerplate and unpack it into the project folder:

        $ curl -L https://github.com/marquee/frontend-boilerplate/tarball/master | tar -zx -C . --strip-components 1

3. (optional but highly recommended steps)

    1. If using git, initialize the repository:

            $ git init
            $ git remote add origin <your remote repository host>

    2. If equipped with [nvm](https://github.com/creationix/nvm), activate the
       environment:

            $ nvm use

4. Run setup:

        $ npm run setup

    This will prompt you for the publication name and access token.

5. Start the development server:

        $ npm run develop

    This will start a development server that automatically compiles the content
    and assets as source changes are made.
