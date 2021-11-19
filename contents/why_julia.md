
# Why Julia {#sec:why_julia}

If you have decided to pick up this book, you likely have heard or been told things about the awesome power of the Julia programming language. This chapter is dedicated for those who have not yet been convinced that Julia is the language of the future. If I don’t need to convince you, please skip to the next chapter to dive into the fun. My personal hope is that one day soon, the Julia community will be large and mature enough that authors of Julia books need not include a “Why Julia” chapter. Until we get to that point, it is still worth it to talk about the benefits. Now back to Julia!

The Julia programming language was created in 2012 by a group of folks who believed that the scientific computing ecosystem could be better.  They were fed up with MATLAB and Python because the former is not Open Source and pay to play while the latter is generally not performant enough to scale up in production environments. Researchers and programmers alike would generally use these tools for prototyping, but when it came time to deploy, they would be forced to rewrite their code in C++ or C in order to meet the performance thresholds required. 

This phenomenon was coined as the “Two Language Problem” and Julia was created, in large part, to address it.  After many years of hard work by Stefan Karpinski, Alan Edelman, Viral Shah, Jeff Bezanson, and enthusiastic contributors around the world, the language hit its 1.0 version release in 2018. The 1.0 release marked a huge milestone for the Julia community in terms of stability and the gave confidence to users that Julia would be along for the long haul. 

In late 2021, Julia 1.6 was selected as the long term supported release. We will be using Julia 1.6 in this book so that the content will be as stable as possible for years to come.

Now that we have some historical context on Julia and why it was created, let us next move through some additional features which make Julia a natural choice for Deep Learning, Machine Learning, and more generally, science. 

## Multiple Dispatch {#sec:dispatch}

There is no one better to talk about the idea Multiple Dispatch and its use in Julia than Stefan Karpinski. In a 2019 JuliaCon talk titled “The Unreasonable effectiveness of Multiple Dispatch”  (https://youtu.be/kc9HwsxE1OY), Stefan went on to state that the Julia ecosystem has more code re-use than any ecosystem he has ever seen. Multiple Dispatch is the paradigm that allows this to happen. So what is Multiple Dispatch and why is it so unreasonably effective? For the latter point, I suggest watching Stefan’s talk, there is no sense in re-stating what he already put eloquently. So back to the main question, what is multiple dispatch? 
The main idea here is that you can write multiple functions with the same name, which dispatch (or are called dynamically) depending on the types of the input arguments. This idea is not something necessarily unique to Julia, other languages have multiple dispatch or similar concepts. But the way in which it is used and implemented in Julia is the secret sauce. Let us now look at a quick example: 


## Package Management {#sec:packages}

Most people are unlikely to choose a programming language based on its package manager (or lack thereof). Despite this reality, the Julia package manager is one of those features that really makes me appreciate the language. Julia’s package manager is extremely simple to work with and also enables much more reproducible code. Let us explore and see how this is the case:

There are two different fundamental ways of working with packages in Julia: via the REPL's Pkg mode and via the Pkg package. I will focus on using the REPL since it is extremely intuitive for new users. You can start by launching Julia in the terminal. Then, type `]` in which should take you into Pkg mode:

```julia
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.6.3 (2021-09-23)
 _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
|__/                   |

(@v1.6) pkg> 
```
From here, one of the natural things to do is check what commands you can run in the package manager. To do this, type an `?` in and press enter/return. 

You will see all the possible commands:

```julia
(@v1.6) pkg> ?
  Welcome to the Pkg REPL-mode. To return to the julia> prompt, either press
  backspace when the input line is empty or press Ctrl+C.

  Synopsis

  pkg> cmd [opts] [args]

  Multiple commands can be given on the same line by interleaving a ; between
  the commands. Some commands have an alias, indicated below.

  Commands

  activate: set the primary environment the package manager manipulates

  add: add packages to project

  build: run the build script for packages

  develop, dev: clone the full package repo locally for development
  ...
  ...
```
Some of the most common commands you will use are `add`, `activate`, `status` (or the shorthand `st`), and `remove` (or the shorthand `rm`). In this book, we will be using Flux.jl, so if you want to play around with the package, you can simply install it by typing `add Flux`. 

After the install finishes, you can check your package environment by typing `status`:

```julia
(@v1.6) pkg> status
      Status `~/.julia/environments/v1.6/Project.toml`
  [587475ba] Flux v0.12.7
```
The package manager automatically shows the file which is managing the packages and their versions. In this case, it is `~/.julia/environments/v1.6/Project.toml`. As a general best practice, it is recommend to always use local environments instead of making changes to your main Julia environment. You can do this by activating a new environment. 

```julia
julia> pwd()
"/Users/logankilpatrick"

shell> cd Desktop # type `;` to enter the shell mode from the REPL
/Users/logankilpatrick/Desktop

(@v1.6) pkg> activate .
  Activating new environment at `~/Desktop/Project.toml`
```
In the code above, you can see I started out in my main user folder. I then entered the shell mode by typing `;` and used the change directory command to switch to my Desktop folder. From there, I did `activate .` which activates the current folder I am in. I can confirm this by typing `status`:

```julia
(Desktop) pkg> status
      Status `~/Desktop/Project.toml` (empty project)
```
and you can see the newly created project is empty. 

Hopefully these examples give you a sense of how easy to user and powerful the Julia package manager is. You can read more about working with packages from the Pkg.jl docs: https://pkgdocs.julialang.org/v1/getting-started/.

## The Julia Community {#sec:community}

I would be remiss if I did not mention the Julia community itself as one of the core features of the ecosystem. Without such an incredible community, Julia would not be what it is today. But what makes the Julia community so great you might ask?  
