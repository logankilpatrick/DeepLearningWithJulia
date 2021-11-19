# Transfer Learning {#sec:transfer_learning}

Transfer learning is one of the most useful and underrated deep learning tools. It allows us to take a model which was trained on a large data set, and "fine tune" it (more on what that means later) to work well for our specific use-case. It gets its name from the idea of learned information being transferred from one use case to another.

You might be asking yourself, why is this so powerful? Well, during the learning process, a deep learning model has to figure out things like what an edge looks like in the case of computer vision. This might seem like an abstract idea but it is a critical step for the model to learn how to distinguish between multiple objects. When we use transfer learning, many of these ideas have already been learned by the existing model we are starting with. This means that we do not need to spend as long training since already know some info about objects, even though the pre-trained model might never has seen data similar to the data you will be feeding into it.

Here is a simple example to try and illustrate why transfer learning works so well: imagine you are trying to teach someone what a car is. This person has never seen a car nor knows what it does. This person has seen a bicycle before and in fact uses one everyday. You can now explain to the person what a car is in terms of how it relates to a bike. The transfer learning process is much like this. Use the existing info that the model has learned and build off of that for some specific situation.

## Pre-trained Models {#sec:pre-trained_models}

The way in which we do transfer learning in the context of deep learning is with pre-trained models. But what is a pre-trained model? In general, we are referring to a model which has been trained on a specific data set. We will be exploring transfer learning in the context of computer vision so this means the model saw many images, each with a label which says what it is, and over time the model learned to correctly say the label given the image. There are a lot of different ideas going on here: computer vision, datasets, transfer learning, and more. *If any of this is not making sense, that is totally expected, there is both a lot of jargon as well as many new ideas being introduced. Try to stay focused on the high level and we will come back to many of these topics in more detail.*

Now that we know the high level idea of transfer learning, let us dive into a real example using Flux. To give some context, in other machine learning frameworks like PyTorch, the pre-trained models are built right into PyTorch itself. In the Flux ecosystem however, the pre-trained models live in a package called [Metalhead.jl](https://github.com/FluxML/Metalhead.jl). Metalhead is built to work with the Flux ecosystem so you do not need to work about writing compatibility issues.

## Metalhead.jl {#sec:metalhead}

Let us start out by installing Metalhead in the package manager by doing `add Metalhead`. Then we can type `using Flux, MetalHead` into a Julia terminal session. Metalhead provides a number of different model types like `resnet`, `vgg`, and more. Over the course of your deep learning experience, you will become more familiar with these model types as they represent some of the most common models for transfer learning. Before we dive into actually using pre-trained models, we will first take a quick look at the model structure which we get from Metalhead and Flux.

```julia
julia> model = ResNet50(pretrain=false)
ResNet(
  Chain(
    Chain(
      Conv((7, 7), 3 => 64, pad=3, stride=2),  # 9_472 parameters
      BatchNorm(64, relu),              # 128 parameters, plus 128
      MaxPool((3, 3), pad=1, stride=2),
      Parallel(
        Metalhead.var"#18#20"(),
        Chain(
          Conv((1, 1), 64 => 64, bias=false),  # 4_096 parameters
          BatchNorm(64, relu),          # 128 parameters, plus 128
          Conv((3, 3), 64 => 64, pad=1, bias=false),  # 36_864 parameters
          BatchNorm(64, relu),          # 128 parameters, plus 128
          Conv((1, 1), 64 => 256, bias=false),  # 16_384 parameters
          BatchNorm(256),               # 512 parameters, plus 512
        ),
        Chain(
          Conv((1, 1), 64 => 256, bias=false),  # 16_384 parameters
          BatchNorm(256),               # 512 parameters, plus 512
        ),
      ),
      ...
      ...
      ...
    Chain(
      AdaptiveMeanPool((1, 1)),
      Flux.flatten,
      Dense(2048, 1000),                # 2_049_000 parameters
    ),
  ),
)         # Total: 162 trainable arrays, 25_557_096 parameters,
          # plus 106 non-trainable, 53_120 parameters, summarysize 97.749 MiB.
```
Now that is a lot to take in (even though most of the model has been omitted for space reasons), but at a high level, it represents the structure of the `ResNet50` model as defined in Flux. Notably, the `50` in `ResNet50` comes from the fact that the model has 50 layers. There are other ResNet like models with different numbers of layers but with the same overall structure. 

