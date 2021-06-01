---
{
"type": "blog",
"author": "Dillon Kearns",
"title": "GSoC Proposal",
"description": "Here's my proposal for elm-tooling",
"image": "images/article-covers/mountains.jpg",
"published": "2021-04-12",
}
---

# Improve pure Elm markdown parser
 Name: Jinyi Wu

 Nick in the Elm Slack: Jinyi

 Possible mentor: Dillon Kearns [@dillonkearns](https://github.com/dillonkearns)

### Summary
This project is based on the idea [Improve pure Elm markdown parser](https://github.com/elm-tooling/gsoc-projects#improve-pure-elm-markdown-parser). 

As the idea described, some specs of the pure Elm markdown parser [dillonkearns/elm-markdown](https://github.com/dillonkearns/elm-markdown) are not yet implemented. So, the goal is to complete the current implementation of [Github-flavored markdown style](https://github.github.com/gfm/), get the automated spec tests passing, and clarify places where it needs to diverge from the spec because of its specific handling of HTML for extensibility. 

### How will I achieve this
I will follow the current [contribution guide](https://github.com/dillonkearns/elm-markdown/blob/master/CONTRIBUTING.md), [elm-markdown’s philosophy and goals](https://github.com/dillonkearns/elm-markdown#philosophy--goals). I will be driven by the GFM test suite. I will document when and how to fail some cases and provide helpful errors. I will try to reach high performance (like using less ‘backtrackable’). 

### What will the project focus on
The project will focus on the GFM spec and helpful errors.

### Benefits
The idea of [dillonkearns/elm-markdown](https://github.com/dillonkearns/elm-markdown)  is awesome,  [see Dillon’s blog](https://elm-pages.com/blog/extensible-markdown-parsing-in-elm). And it is currently used for a lot of elm-pages applications. So many users and developers will benefit from the helpful errors and complete specs provide by this GSOC project.


### Timeline
Based on the automated spec test suite, the task of this project is quite specific and easy to break down into subtasks and the process of this project is manageable.

#### Weeks of May 18 - June 8 (Community bonding)
To be more specific, I will discuss my solutions for the top3 challenging GFM specs (I’ll have 1-3 solutions to each issue) and the design of when to provide helpful errors with the markdown community and my mentor. And from there, I will determine whether the implementation of some extremely difficult specs is optional depend on its risk. For other required but difficult specs,  I will get my mind more clear about the implementation at a high level and prepared for the coding. 

I’ve seen the current elm-markdown’s implementation and CommonMark’s official implementations which have many differences. So, I will continue to investigate other markdown parsing works’ implementation and handle of errors, particularly those implemented in functional language and have errors. 

What I will do in this period but not limited to this period: I will learn more about the elm ecosystem, its toolchains, its packages, its development ideas… And I also will try to learn from and contribute to the community. Especially, I find myself quite interested in other students’ projects and hope to communicate with them.

#### Weeks of June 8 - June 21
I will implement GFM extension specs [Autolinks](https://github.com/dillonkearns/elm-markdown/issues/57). I will solve the issue of [Thematic precedence](https://github.com/dillonkearns/elm-markdown/issues/59), which might be a good start point to the lists specs. And I will solve any other minimal failing GFM spec test cases that are discovered as possible. 

#### Weeks of June 22 - July 16
Based on the previously discussed solutions, I will focus on the improvements of the current implementation of container blocks (Block quote, List, and List Item), as well as link reference definitions.   And I will try to provide complete entity, which is previously troubled by elm’s large list problem. 

#### July 13 - July 17 (First Evaluation)
For the first evaluation, I will all basic specs implemented and get my work reviewed by the mentor and the community to get feedback. I will publish the write-ups of my development process.

#### Weeks of July 17 - July 31
I will pass the remaining minimal failing GFM spec test cases. And I will focus on the failing cases with helpful errors, the Html blocks, and inline raw Html. 

#### Weeks of August 1 - August 16
I will adjust the current documents to including new specs and failing cases with help errors. I will document clearly where it derives from GFM. I will update the current examples and write a tiny example to illustrate new spec and failing cases. I will give my idea about how this project can further be improved, like for its extensibility, failing cases, performance. 

#### August 17 - August 24 (Code Submission and Final Evaluation)
I will get my final project reviewed by my mentor and the community to get feedback. I will publish all my write-ups and a summary of my experience.

### Goals
Just as the idea, the goal is to try the automated spec tests passing and clarify places where it needs to diverge from the spec because of its specific handling of HTML for extensibility. But for some extremely difficult specs, I will discuss those with my mentor, determine whether it is optional and refine my goals before the coding period. 

###  Requirements
 Elm, parsing, markdown







