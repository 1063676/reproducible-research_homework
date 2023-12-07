# Reproducible research: version control and R


Question 4
----------
-Part 1

Upon opening the code, my first move after installing and loading the two libraries was to read through it. 

The random_walk() function interested me, as I hadn't seen a lot of the lines within in before, mainly the ones regarding the dataframe manipulations. All I could really figure out was that there seemed to be some kind of random movement being coded for through use of steps and angles, and there were indexes and for loops used. 

I was able to understand the creation of the plots quite well. They seem to be two identically coded plots, the only difference being the dataframe used. The dataframes also seem to be generated the same way by using the newly created random_walk() function on the input 500. Though I still didn't quite understand what the random_walk() function would result in, I had a feeling there would be some kind of movement of a point on a graph. And finally, I knew that the last line (grid.arrange(plot1, plot2, ncol=2)) would place the two plots side by side. 

Having decided my first impressions of the code, I ran it. What was outputted was somewhat like a more complicated version of what I had expected. I had expected a slightly shorter walk, and the colouring by time took me by surprise. As I expected, the two graphs were completely different, and each time I ran the code, different graphs were outputted for both walks. I had expected this from the name of the function, but I still wasn't sure what caused the randomness. 

However, I was now able to figure out a bit more about the code. I realised from the time legend, the input of 500 into random_walk(), and the n_steps parameter while defining the function, that each particle took 500 steps on the graph. Changing this input allowed me to study the graph better. When I changed it to only 10 steps, I realised that the point started at (0,0) each time, and could move in any direction and seemingly any distance (within a certain range). I also realised that the particles move 1 step per time unit, so I assume time is just a proxy used to show the particle's path. 

A two-dimensional datafram seemed to be set up through defining df[1,], where the first value was 1, and the second value was undefined. Beyond this, I really didn't understand the definition of the dataframes in the function definition, so I moved onto the for loops. I could see that the loops were being repeated, starting at 2, incrementing by 1 (using the i as an index) up until the number of steps (which was 500 in the original code) was reached. That meant the for loop ran once per step the particles took, and so that must be what was generating each random step. Specifically, the for loop must be generating the random angle. The runif() function was setting a minimum and maximum for the angle of the particle, and then this was used in a couple of alterations to dataframes. Whatever number within the minimum and maximum was then altered by either the sine or cosine function and multiplied by 0.25. I realised in the following lines of code that 3 different arrays in the same dataframe had been set up, denoted by the second numbers in the df[,], where the second number defined the array and the first number defined the step of the particle. I also noticed that the arrays/index were being incremented each time the for loop was run, to allow the correct number of steps to be defined. 

Finally, the dataframe was returned from the function. I hypothesised that the output would be a dataframe containing three different two dimensional arrays, where the first two would be df[500 random angles, 1] and df[500 random angles, 2], and the third would just seem to be df[numbers 1-100, 3]. 

To test this, I set the number of steps to 10, and just loaded data1. I found that I was slightly incorrect - while I was right in thinking the first two arrays created n random angles while the third counted 1-n steps, 
I found that these were combined. The resulting output was 2 random angles labelled 'x' and 'y', along with an index keeping track that was labelled 'time'. One thing I misunderstood was that I had assumed the code generated a random angle and distance, rather than what it was actually doing: generating a random co ordinate for the particle to travel to each step. 

From there, all I had to do was a bit of research to understand how the dataframe was being defined, and what the runif() function did. Whereas I had assumed it was creating an if loop (I had read it as "run if"), it was actually generating a random number for the 'angle' variable (instead being read as "random uniform") within the bounds of 0 and 2*pi. I now understood all of the code, and how it generated the two graphs. 


-Part 2

I had vaguely heard the term "random seed" before. I knew it was used in coding, and was used to generate some kind of random number - in the video game Minecraft, worlds are generated through the use of random seeds, which appear to be random generated numbers. Beyond this, I knew nothing, so I had to research. 

I learnt quickly that "random seeds" are numbers used to generate other, partially random numbers. They this means is that they are the initial value inputted into a number generator, out of which a psuedorandom value is produced. What this means is that if you put the random seed into a number generator, a seemingly random number will be outputted. If you put in a different number, you get a different output. However, putting the same initial seed into the number generator will output the same number each time. Thus, the number generator used is not random, but putting the random seed through an algorithm to produce a certain value. However, for all intents and purposes, the number outputted is random as is treated in experiments as if it is randomly generated. 

The most important use of this is in experiments requiring randomly generated numbers, such as neural network modelling, where it may be used for random parameter generation, random example sampling or random generation of neurons (1). By use of random seeds and pseudorandom number generators, it makes the randomness reproducible. This means that when an experiment is being repeated or tested by others, if the same random seed is inputted, the same output should be received, and this introduces reproducibilty by allowing the same trends to be seen. 

1. Reference: Madhyastha, P. and Jain, R. (2019). On Model Stability as a Function of Random Seed. [online] arXiv.org. doi:https://doi.org/10.48550/arXiv.1909.10447.


-Part 3






## Instructions

The homework for this Computer skills practical is divided into 5 questions for a total of 100 points (plus an optional bonus question worth 10 extra points). First, fork this repo and make sure your fork is made **Public** for marking. Answers should be added to the # INSERT ANSWERS HERE # section above in the **README.md** file of your forked repository.

Questions 1, 2 and 3 should be answered in the **README.md** file of the `logistic_growth` repo that you forked during the practical. To answer those questions here, simply include a link to your logistic_growth repo.

**Submission**: Please submit a single **PDF** file with your candidate number (and no other identifying information), and a link to your fork of the `reproducible-research_homework` repo with the completed answers. All answers should be on the `main` branch.

## Assignment questions 

1) (**10 points**) Annotate the **README.md** file in your `logistic_growth` repo with more detailed information about the analysis. Add a section on the results and include the estimates for $N_0$, $r$ and $K$ (mention which *.csv file you used).
   
2) (**10 points**) Use your estimates of $N_0$ and $r$ to calculate the population size at $t$ = 4980 min, assuming that the population grows exponentially. How does it compare to the population size predicted under logistic growth? 

3) (**20 points**) Add an R script to your repository that makes a graph comparing the exponential and logistic growth curves (using the same parameter estimates you found). Upload this graph to your repo and include it in the **README.md** file so it can be viewed in the repo homepage.
   
4) (**30 points**) Sometimes we are interested in modelling a process that involves randomness. A good example is Brownian motion. We will explore how to simulate a random process in a way that it is reproducible:

   - A script for simulating a random_walk is provided in the `question-4-code` folder of this repo. Execute the code to produce the paths of two random walks. What do you observe? (10 points)
   - Investigate the term **random seeds**. What is a random seed and how does it work? (5 points)
   - Edit the script to make a reproducible simulation of Brownian motion. Commit the file and push it to your forked `reproducible-research_homework` repo. (10 points)
   - Go to your commit history and click on the latest commit. Show the edit you made to the code in the comparison view (add this image to the **README.md** of the fork). (5 points)

5) (**30 points**) In 2014, Cui, Schlub and Holmes published an article in the *Journal of Virology* (doi: https://doi.org/10.1128/jvi.00362-14) showing that the size of viral particles, more specifically their volume, could be predicted from their genome size (length). They found that this relationship can be modelled using an allometric equation of the form **$`V = \beta L^{\alpha}`$**, where $`V`$ is the virion volume in nm<sup>3</sup> and $`L`$ is the genome length in nucleotides.

   - Import the data for double-stranded DNA (dsDNA) viruses taken from the Supplementary Materials of the original paper into Posit Cloud (the csv file is in the `question-5-data` folder). How many rows and columns does the table have? (3 points)
   - What transformation can you use to fit a linear model to the data? Apply the transformation. (3 points)
   - Find the exponent ($\alpha$) and scaling factor ($\beta$) of the allometric law for dsDNA viruses and write the p-values from the model you obtained, are they statistically significant? Compare the values you found to those shown in **Table 2** of the paper, did you find the same values? (10 points)
   - Write the code to reproduce the figure shown below. (10 points)

  <p align="center">
     <img src="https://github.com/josegabrielnb/reproducible-research_homework/blob/main/question-5-data/allometric_scaling.png" width="600" height="500">
  </p>

  - What is the estimated volume of a 300 kb dsDNA virus? (4 points)

**Bonus** (**10 points**) Explain the difference between reproducibility and replicability in scientific research. How can git and GitHub be used to enhance the reproducibility and replicability of your work? what limitations do they have? (e.g. check the platform [protocols.io](https://www.protocols.io/)).
