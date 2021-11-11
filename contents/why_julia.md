# Why Julia {#sec:WhyJulia}

If you have decided to pick up this book, you likely have heard or been told things about the awesome power of the Julia programming language. This chapter is dedicated for those who have not yet been convinced that Julia is the language of the future. If I don’t need to convince you, please skip to the next chapter to dive into the fun. My personal hope is that one day soon, the Julia community will be large and mature enough that authors of Julia books need not include a “Why Julia” chapter. Until we get to that point, it is still worth it to talk about the benefits. Now back to Julia!

The Julia programming language was created in 2012 by a group of folks who believed that the scientific computing ecosystem could be better.  They were fed up with MATLAB and Python because the former is not Open Source and pay to play while the latter is generally not performant enough to scale up in production environments. Researchers and programmers alike would generally use these tools for prototyping, but when it came time to deploy, they would be forced to rewrite their code in C++ or C in order to meet the performance thresholds required. 

This phenomenon was coined as the “Two Language Problem” and Julia was created, in large part, to address it.  After many years of hard work by Stefan Karpinski, Alan Edelman, Viral Shah, Jeff Bezanson, and enthusiastic contributors around the world, the language hit its 1.0 version release in 2018. The 1.0 release marked a huge milestone for the Julia community in terms of stability and the gave confidence to users that Julia would be along for the long haul. 

In late 2021, Julia 1.6 was selected as the long term supported release. We will be using Julia 1.6 in this book so that the content will be as stable as possible for years to come.

Now that we have some historical context on Julia and why it was created, let us next move through some additional features which make Julia a natural choice for Deep Learning, Machine Learning, and more generally, science. 

## Multiple Dispatch

There is no one better to talk about the idea Multiple Dispatch and its use in Julia than Stefan Karpinski. In a 2019 JuliaCon talk titled “The Unreasonable effectiveness of Multiple Dispatch”  (https://youtu.be/kc9HwsxE1OY), Stefan went on to state that the Julia ecosystem has more code re-use than any ecosystem he has ever seen. Multiple Dispatch is the paradigm that allows this to happen. So what is Multiple Dispatch and why is it so unreasonably effective? For the latter point, I suggest watching Stefan’s talk, there is no sense in re-stating what he already put eloquently. So back to the main question, what is multiple dispatch? 
The main idea here is that you can write multiple functions with the same name, which dispatch (or are called dynamically) depending on the types of the input arguments. This idea is not something necessarily unique to Julia, other languages have multiple dispatch or similar concepts. But the way in which it is used and implemented in Julia is the secret sauce. Let us now look at a quick example: 


## Package Management

Most people are unlikely to choose a programming language based on its package manager (or lack thereof). Despite this reality, the Julia package manager is one of those features that really makes me appreciate the language. Let me give you an example of a typical Python workflow I find myself in frequently (and note that while this example highlights a high point for Julia, the intent is not to bash the Python ecosystem):

[Insert python package example]

As you can see from the above example, what is going wrong is less than clear to a potential new user which can be very frustrating. Julia’s package manager is extremely simple to work with and also enables much more reproducible code. Let us explore and see how this is the case:

[Insert package manager code]

## The Julia Community
I would be remiss if I did not mention the Julia community itself as one of the core features of the ecosystem. Without such an incredible community, Julia would not be what it is today. But what makes the Julia community so great you might ask?  
