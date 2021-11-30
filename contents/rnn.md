# Recurrent Neural Networks {#sec:rnn}

At a high level, recurrence is built on the idea that the order (or sequence) of input data is important when trying to derive some final output. For example, spoken or written words are a great example of this. If you randomize the order of the words, a doesn't with up sentence you sense end make that. Okay, you get the idea. But how can we model the idea of sequential data in a neural network? 

The simplest way to do so is to take a neuron, which normally only takes in a set of new input data, and also pass the internal state of the previous neurons to the new neuron. This idea is fundamentally refereed to as neuron memory and is the mechanism which enables sequential data to be processed. To re-iterate, rather than a model taking in and processing some discrete input (i.e. a single word), it now takes in that word along with all previous words. This context makes it significantly more feasible to predict the next word that might be stated. And again, the sequential aspect of this is important because in the context of words, sequence is everything. 

