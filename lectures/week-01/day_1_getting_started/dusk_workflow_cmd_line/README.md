# Day 1
## Getting Started

![getting started](http://alock011.students.digitalodu.com/wp-content/uploads/2014/03/Padawans.jpg)
# Living in the Command Line

| Objectives |
| :--- |
| Navigate the terminal and have an understanding of the tools available in it. |


## Background

Web programmers have to live on the command line.  It gives us fast, reliable, and automatable control over computers.  Web servers usually don't have graphical interfaces, so we need to interact with them through command line and programmatic interfaces.  Once you become comfortable using the command line, staying on the keyboard will also help you keep an uninterrupted flow of work going without the disruption of shifting to the mouse.

Regarding scripts which you may find on the web while searching for solutions, assume they are going to do something bad

Important Note:
*** You should not copy / paste scripts from web pages and run them in your terminal until you have read them and understand what they do, bad things can happen, particularly with `sudo` and `su` commands ***

#Topics

* Command Line Overview
  * `cd`
  * `mkdir`
  * `touch`
  * `ls`
  * `rm`
  * `grep`
  * `cat`, `less`
  * `|` (pipe), `cat`, `>`, `>>`
  * Extras
    * `fortune`, `wall-cat`, `wget`
  * vim 
  * `ZShell`
* [Introduction](#intro)
  * What is the Terminal
  * Opening the Terminal Application
* [Current Working Directory](#current)
  * Current Directory
  * Home Directory
  * `ls`,`pwd`, commands
* [Navigating Around](#navigating)
  * Root Directory
  * `cd`  
  * Absolute and Relative Paths
  * Tab Completion
* [File Manipulation](#files)
  * `mkdir`
  * Editing Files   
  * `echo`, Redirection and Piping
  * Moving, Copying and Removing
* [Command Execution](#execution)  
  * `$PATH`
  * `which ruby`
* [Review](#review)
  * Getting Help
  * Bonus Topics /
  Further Reading


#<a name="intro"></a>Introduction
## What is the Terminal?

Terminal is a modern version of an 'original' `User Interface` for unix based computers. At that time a [Text Terminal](http://en.wikipedia.org/wiki/Computer_terminal#Text_terminals) is all you would have seen, no windows, no mouse. Because of this history, it's very powerful but sometimes a little cryptic. 

Don't worry though, with a bit of practice you'll be flying around like a pro!

Although they technically mean slightly different things, the following terms are synonymous with the Terminal Environment

  *  Shell
  *  bash ('Bourne-Again shell', although I've haven't heard that used recently)
  *  Command Line
  *  Text Terminal
  *  DOS Prompt (on windows machines)
  *  SSH (on remote machines)
  *  Bourne Shell
  *  csh
  *  ksh
  *  sh
  *  [UNIX Shell](http://en.wikipedia.org/wiki/Unix_shell)

## Opening the Terminal

__Follow Along:__

1.  In the top right of the screen click the Magnifying Glass icon to bring up 'Spotlight' and type 'Terminal'. (You can open this quickly by hitting `CMD + SPACE`.)
2.  Once Terminal starts locate the icon in the doc and select `Options->Keep In Dock` so that it's always handy


#<a name="current"></a>Current Working Directory

The file structure you see in the Terminal is the same as the one you see in the `Finder` application. Finder tends to hide some of the folders from you to keep things simple for most users, but everywhere that you go in Finder is accessible through 'Terminal'. 


## Where am I?

Typically the shell will start in your `HOME` directory, each user has their own `HOME` directory, but on your computer it is common for you to be the only real user. At any given time a terminal shell process has one __current working directory__

__Follow Along:__

    [anil:~]$ pwd
    /Users/del
  
For me this is `Users/del`, what is the __current working directory__ of your shell process? 

Wherever we are, `pwd`, short for __print working directory__, will show us what directory we are in.

__Follow Along:__

    [del:~]$ open .
    
Wherever we are, `open .`, opens a `Finder` window in the current directory, this can be handy sometimes

   
## Looking Around
What can we find out about the  __current working directory__ ?

One of the most useful commands is:

  
    [anil:~]$ ls 

Which **l**i**s**ts the files and directories in the current working directory:

  
    [anil:~]$ ls 
    Applications  Justinmind  Pictures  gitshell.sh rorshell.sh
    Desktop   Library   Public    hashes  rorshellws.sh
    Documents Movies    bin   helloroom work
    Downloads Music   git_profile.sh  phpshell.sh

Personally I find this a little difficult to read so I use the long form:
  
    [anil:~]$ ls -l
    total 48
    drwxr-xr-x    2 anil  staff    68 Dec  4 15:13 Applications
    drwx------+   6 anil  staff   204 Mar 23 18:20 Desktop
    drwx------+  11 anil  staff   374 Feb 27 10:57 Documents
    drwx------+ 141 anil  staff  4794 Apr  5 08:04 Downloads
    drwxr-xr-x    3 anil  staff   102 Nov 12 13:56 Justinmind
    drwx------@  56 anil  staff  1904 Apr  4 21:58 Library
    drwx------+   3 anil  staff   102 Nov  4 10:49 Movies
    drwx------+   8 anil  staff   272 Mar  5 15:48 Music
    drwx------+  20 anil  staff   680 Mar 23 12:53 Pictures
    drwxr-xr-x+   5 anil  staff   170 Nov  4 10:49 Public
    drwxr-xr-x    3 anil  staff   102 Jan 31 13:21 bin
    -rwxr-xr-x    1 anil  staff   184 Nov  8 16:41 git_profile.sh
    -rw-r--r--    1 anil  staff   327 Mar 27 09:22 gitshell.sh
    drwxr-xr-x   22 anil  staff   748 Feb  3 15:15 hashes
    drwxr-xr-x    3 anil  staff   102 Apr  1 10:34 helloroom
    -rwxr-xr-x    1 anil  staff   409 Nov 15 12:13 phpshell.sh
    -rwxr-xr-x    1 anil  staff   299 Jan 31 13:27 rorshell.sh
    -rwxr-xr-x    1 anil  staff   316 Feb  2 10:35 rorshellws.sh
    lrwxr-xr-x    1 anil  staff     5 Nov  7 18:22 work -> /work

Now I can see a lot more clearly what files are in my current working directory. Some of these items are files, some are directories and in my case also have a `link` which we'll deal with on another day :)

The `ls` command can take a directory as an argument

    [anil:~]$ ls -l Documents/
    total 40360
    drwxr-xr-x   4 anil  staff      136 Feb 22 20:01 Rails
    -rw-r--r--@  1 anil  staff  8154896 Feb 27 10:57 Profile.png
    -rw-r--r--@  1 anil  staff  6258658 Feb 27 10:57 Profile2.png

The `ls` command can also take a wildcard as an argument

    [anil:~]$ ls -l Documents/*.png
    -rw-r--r--@ 1 anil  staff  8154896 Feb 27 10:57 Documents/Profile.png
    -rw-r--r--@ 1 anil  staff  6258658 Feb 27 10:57 Documents/Profile2.png

##Hidden Files

Have you ever heard of `hidden files`? Well it's true, they are real! and we can see them:
  
    [anil:~]$ ls -la
    total 368
    drwxr-xr-x+  76 anil  staff   2584 Apr  6 10:30 .
    drwxr-xr-x    6 root    admin    204 Nov  4 10:47 ..
    -rw-r--r--@   1 anil  staff  15364 Apr  2 16:00 .DS_Store
    -rw-------    1 anil  staff   8949 Apr  1 17:21 .bash_history
    -rw-r--r--    1 anil  staff    285 Mar 17 14:50 .bash_profile
    -rw-r--r--    1 anil  staff     59 Feb  2 13:47 .bashrc
    drwxr-xr-x    5 anil  staff    170 Dec  5 13:21 .bundler
    -rw-r--r--    1 anil  staff    379 Mar  3 17:36 .gitconfig
    drwxr-xr-x   30 anil  staff   1020 Feb  2 13:47 .rvm
    drwxr-xr-x    2 anil  staff     68 Dec  4 15:13 Applications
    drwx------+   6 anil  staff    204 Mar 23 18:20 Desktop
    drwx------+  11 anil  staff    374 Feb 27 10:57 Documents
    drwx------+ 141 anil  staff   4794 Apr  5 08:04 Downloads
    drwxr-xr-x    3 anil  staff    102 Nov 12 13:56 Justinmind
    drwx------@  56 anil  staff   1904 Apr  4 21:58 Library
    drwx------+   3 anil  staff    102 Nov  4 10:49 Movies
    drwx------+   8 anil  staff    272 Mar  5 15:48 Music
    drwx------+  20 anil  staff    680 Mar 23 12:53 Pictures
    drwxr-xr-x+   5 anil  staff    170 Nov  4 10:49 Public
    drwxr-xr-x    3 anil  staff    102 Jan 31 13:21 bin 
    ......More Files.....
    -rwxr-xr-x    1 anil  staff    184 Nov  8 16:41 git_profile.sh
    -rw-r--r--    1 anil  staff    327 Mar 27 09:22 gitshell.sh
    drwxr-xr-x   22 anil  staff    748 Feb  3 15:15 hashes
    drwxr-xr-x    3 anil  staff    102 Apr  1 10:34 helloroom
    -rwxr-xr-x    1 anil  staff    409 Nov 15 12:13 phpshell.sh
    -rwxr-xr-x    1 anil  staff    299 Jan 31 13:27 rorshell.sh
    -rwxr-xr-x    1 anil  staff    316 Feb  2 10:35 rorshellws.sh
    lrwxr-xr-x    1 anil  staff      5 Nov  7 18:22 work -> /work

Hidden Files are typically used by applications to store configurations and there will be a many of them in your home directory. Most users don't want to be editing these files so they don't show up in `Finder`, but you as a software developer will be editing some these for yourself later on in the course.

Hidden files are hidden because their names begin with `.`

##Mini Review - Current Working Directory

* pwd
* Home Directory
* open .
* ls -la

#<a name="navigating"></a>Navigating Around

##Root Directory
Another important directory is the root directory `/`
  
    [anil:~]$ cd /
    [anil:/]$ pwd
    /

As we discovered the files on your computer are structured in a tree. The 'top' of the file system is know as the `root` directory (That may sound upside down, but in our case the root is at the top :) )

We can move to the __root directory__ with the command `cd /`.  
We can move back to your __home directory__ with the command `cd ~`.  

    [anil:/]$ cd ~
    [anil:~]$ pwd
    /Users/anil

You might have noticed that the prompt changed from `[anil:/]$` to `[anil:~]$`. The default prompt includes the current username and the current directory
  
    [anil:~]$ cd /Users/anil/
    [anil:~]$ 

The `~` always refers to the current user's home directory, this is handy for scripts and for you, but you can use the full path just as well if you know it, `pwd` will give you the full path

##Absolute and Relative Paths
Go to you home directory with `cd ~` and __Try this now__

  cd ./

What happened? Which directory are you in?

Try this

  cd ../
  pwd

What happened? Which directory are you in?


* `./` prefixes paths relative to the current directory
* `../` prefixes paths relative to the parent directory

These  (`./` and `../`) are __relative paths__ and you can use them anywhere you would use a path

    [anil:~]$ ls -al ../Guest
    total 0
    drwxr-xr-x+ 11 Guest  _guest  374 Nov  4 10:47 .
    drwxr-xr-x   6 root   admin   204 Nov  4 10:47 ..
    drwx------+  3 Guest  _guest  102 Nov  4 10:47 Desktop
    drwx------+  3 Guest  _guest  102 Nov  4 10:47 Documents
    drwx------+  4 Guest  _guest  136 Nov  4 10:47 Downloads
    drwx------+ 26 Guest  _guest  884 Nov  4 10:47 Library
    drwx------+  3 Guest  _guest  102 Nov  4 10:47 Movies
    drwx------+  3 Guest  _guest  102 Nov  4 10:47 Music
    drwx------+  3 Guest  _guest  102 Nov  4 10:47 Pictures
    drwxr-xr-x+  4 Guest  _guest  136 Nov  4 10:47 Public
  

## Tab Completion
Hitting `<TAB>` autocompletes.  Hit `<TAB>` constantly.

It's important to remember that being in one room is much like being in another room.  The difference is in the contents and the relative position of other folders.

## Pair Practice
__Exercise: 5 minutes in Pairs__ 

1. Using Finder: Pick a directory somewhere under the /Users directory on your partner's computer
2. Your Task: Navigate to that directory in a single command from your home directory using a relative or absolute path
3. Help your partner if they are having trouble and use Tab Completion


##Mini Review - Navigating Around
* root directory `/`
* `./` and `../`
* Absolute and Relative Paths
* Tab Completion

#<a name="files"></a>File Maniuplation

##mkdir

Now that we know how to move around, it's time to make some changes. We can make directories with the `mkdir` command.  Look at `man mkdir`.  What's the format of the command for making a directory?

    MKDIR(1)                  BSD General Commands Manual                 MKDIR(1)
    
    NAME
         mkdir -- make directories
    
    SYNOPSIS
         mkdir [-pv] [-m mode] directory_name ...
    
    DESCRIPTION
         The mkdir utility creates the directories named as operands, in the order specified, using
         mode rwxrwxrwx (0777) as modified by the current umask(2).

__Operands__ (or arguments or parameters) are what comes after a command, so we write `mkdir living_room` to make a new room, where we will keep our couches.  Keep your directory names lowercase in almost every case.  Separating words with underscores is called snake_case.

__Try This__
  
    [anil:~]$ cd ~
    [anil:~]$ mkdir living_room

What command can you use to see the results of you handiwork? 

##Adding and Editing Files

Let's `cd` into our new `living_room`  Look around with `ls`, and `ls -la`.  What do you see?

__Exercise__
I want my living room to have a bookshelf full of books.  Let's make a file that lists all of our books.  Type `subl books.txt` to open Sublime Text editing a new file called `books.txt`.  Add a few books, copy and paste the section below so we all have some books in common, and save the file.  Make sure the books you add are in the same format:  `<author_given_name>, <author_last_name>:<title>`.

```
Carroll, Lewis:Through the Looking-Glass
Shakespeare, William:Hamlet
Bartlett, John:Familiar Quotations
Mill, John anil:On Nature
London, Jack:John Barleycorn
Bunyan, John:Pilgrim's Progress, The
Defoe, Daniel:Robinson Crusoe
Mill, John anil:System of Logic, A
Milton, John:Paradise Lost
Johnson, Samuel:Lives of the Poets
Shakespeare, William:Julius Caesar
Mill, John anil:On Liberty
Bunyan, John:Saved by Grace
```

Now try `ls -la` again.  Do you see the `books.txt` file?  Look at the contents with `cat`.  Let's make another, smaller file, which will be our bookshelf.  Describe the bookshelf, and just say the description to ourselves.

## File Permissions
The column on the left e.g.: `-rwxr-xr-x` displays the files' permissions. That is whether or not you can read, write or execute the file
The display also includes the type of file `d` for directory, `l` for link, `-` for files

Here's a tutorial on file permissions, if you're interested in unpacking that column: [http://en.flossmanuals.net/command-line/permissions/](http://en.flossmanuals.net/command-line/permissions/)

##echo and Redirection
__Try This__

  echo "This bookshelf flexes under the weight of the books it holds."
  
`echo` is a command that just echoes (outputs) what we give to it as arguments (same as operands).  Now we want to put that line in a file called `bookshelf.txt`.

__Try This__
  
  echo "This bookshelf flexes under the weight of the books it holds" > bookshelf.txt

Using the closing angle bracket `>` in this way is called redirection.  Every command that we run in the shell has an input, an output, an error output, and arguments/operands.  We are saying:  "Run `echo` with this string as an operand, and take the output and put it in a new file called bookshelf."  Try running `ls` again, and `cat` our new file.  

Two angle brackets `>>` appends the string to the end of the file:

__Try This__

  echo "It does not break, it does its job admirably" >> bookshelf.txt

Try `cat bookshelf.txt` to see the result


Adapted from [http://en.flossmanuals.net/command-line/piping/](http://en.flossmanuals.net/command-line/piping/)

## Piping

Let's look back at our books.  Read out the file.  Notice that the list of books is unsorted!  We need to organize this using the `sort` command.

Try `cat books.txt`, and `cat books.txt | sort`.  The character `|` is called the pipe.  We take the output from `cat books.txt` and send it through a pipe to `sort`.  The output of `cat books.txt` becomes the input of `sort`.  Now send the output of `sort` to a file:

__Try This__

  cat books.txt | sort
  
__Try This__

  cat books.txt | sort > sorted_books.txt

Look around again to see how the room has changed.

There are dozens of powerful tools we can leverage using pipes.  One of the ones you'll be using the most is `grep`.

__Try This__

  cat books.txt | grep Mil
  
See how we filtered out just the lines that contain Mil?  Try grepping for something else.

## Moving 

Now that we have our books sorted, we really don't need our unsorted list of books.  `mv` stands for move, and that's how we move files and folders from place to place.

__Try This__

  mv sorted_books.txt books.txt
  
Look around and see how the room has changed.

## Copying 
To copy files, we use the `cp` command.  Extrapolate from the way we used `mv` to copy the file `bookshelf.txt` to add a file `second_bookshelf.txt`.

__Try This__

  cp bookshelf.txt second_bookshelf.txt

## Removing
`rm` is short for remove.  Use `rm` to remove the `second_bookshelf.txt` file we just created with `cp`.

__Try This__

  rm second_bookshelf.txt

##Filename Wildcards

Sometimes we want to refer to a bunch of similar files, to do this we can use wildcards. The most common wildcard to use is `*` usually along with a file extension:
__Try This__

  ls -la *.txt

For more ideas go here: [How to Use Wildcards](http://www.linfo.org/wildcard.html)

## Mini Review - File Maniuplation

* `mkdir`
* editing files
* echo
* redirection `>` and `>>`
* piping
* moving, copying and removing



#<a name="execution"></a>Command Execution

### The Shell is Programming

In interacting with the terminal like we did today, we've been using a programming language called __bash__, which stands for _Bourne-again shell_.  There are many different shell languages, but the commands we went over today will work in almost any.  Another common shell is __zsh__.  

The fact that we interact with the computer by programming empowers us. Instead of struggling to talk about the difference between two menus in a graphical program, we can communicate precisely about shell commands that have a predictable effect.

### What happens when you run a command?

Sometimes it's important to know how the shell finds the commands that you run.  The command `which [command-name]` will tell you the location of the file which will be run when you execute that command.  For example, `which rm` on my computer gives `/bin/rm`.

`which ruby` gives `/Users/raphael/.rvm/rubies/ruby-2.0.0-p247/bin/ruby`

The shell finds these commands by looking at the PATH variable in the shell.  `echo $PATH` will show you the contents of PATH.  It should be a list of directories separated by `:`.  When you run any command, the shell looks in the directories for files that match the name of the command you're trying to run, and executes the first one it finds.  Most of you should have a line changing PATH in your `~/.bash_profile` file, which is run every time you open a new terminal session (tab or window).

__Try This__

    [anil:~]$ echo $PATH
    /Users/anil/.rvm/gems/ruby-2.1.0/bin:/Users/anil/.rvm/gems/ruby-2.1.0@global/bin:/Users/anil/.rvm/rubies/ruby-2.1.0/bin:~/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/anil/.rvm/bin


#<a name="review"></a>Review
##History
What have we been up to?

    [anil:~]$ <UP ARROW>
    [anil:~]$ <UP ARROW>
    [anil:~]$ <DOWN ARROW>
    [anil:~]$ <DOWN ARROW>
    [anil:~]$ history
##Topics  
  * Current Directory
  * Home Directory
  * `ls`,`pwd`, commands
  * Root Directory
  * `cd`  
  * Absolute and Relative Paths
  * Tab Completion
  * `mkdir`
  * echo, Redirection and Piping
  * Moving, Copying and Removing
  * `$PATH`
  * `which ruby`


## Getting Help
For any command we discuss here, the command `man`, short for __manual__, will give a (hopefully) detailed explanation of that command.  Sometimes that explanation will be too detailed for you.  When you get lost in a man page and you want to understand it, start again from the beginning of of the __man page__ and keep repeating.  Hopefully you will get further into the page each time you read it.

Many advanced commands also accept the --help option, but not all, but if you get stuck it can be worth a try. Most of the commands covered in this simple overview do not support this feature

    $ git --help
    
    usage: git [--version] [--help] [-C <path>] [-c name=value]
             [--exec-path[=<path>]] [--html-path] [--man-path] [--info-path]
             [-p|--paginate|--no-pager] [--no-replace-objects] [--bare]
             [--git-dir=<path>] [--work-tree=<path>] [--namespace=<name>]
             <command> [<args>]

__Note:__ In documentation we often see a `#` or a `$` prefix before code examples, these characters are used to indicate that the example is a something which is executed in the terminal (as opposed to being a code sample) and usually these are not supposed to be entered when you execute a command. 


##Bonus Topics
* Terminal Cheat Sheet
* `cat ~/.bash_profile`
* `echo "$PATH"`
* `export EDITOR='subl -w'`
* Different Types of shell
* Custom Git Prompt


###Terminal Cheat Sheet
Bookmark this:

* [http://bit.ly/terminalcheats](http://bit.ly/terminalcheats)

###Customize your shell
When a bash shell starts, some (usually hidden) files are automatically read to set up it's `export`ed environment variables and `alias`es. Try this:

* `cat ~/.bash_profile`

### Set your default editor
Just made a git commit without a comment? You may find yourself in `vi` hell. You can avoid this by setting your default editor in your `~/.bash_profile`

* `export EDITOR='subl -w'`

### Different Types of Shell
You'll mostly be using `bash` as your shell, but there are other similar programs which you may see at work

* [http://unixhelp.ed.ac.uk/shell/oview2.html](http://unixhelp.ed.ac.uk/shell/oview2.html)


###Custom Git Prompt
* Add tab completion for git commands and branch names, try these instructions:
  [http://bit.ly/gitprompt](http://bit.ly/gitprompt)
  


## Further Reading
Linux is almost the same as OSX, and this is a great manual about the Linux command line:

[The GNU Guide to the Command Line](http://en.flossmanuals.net/command-line/)

Here's a starter book on using the command line:

[The Command Line Crash Course](http://cli.learncodethehardway.org/book/)

Here's an interesting anecdote about why Standard Output and Standard Error are separate:

[The Birth of Standard Error](http://spinellis.gr/blog/20131211/)