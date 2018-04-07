Developing Data Products - Course Project
========================================================
author: Ali Richomme
date: 7th April 2018
autosize: true

The Data
========================================================

This application is based on Edgar Anderson's Iris Data which gives measurements (in cm's) of sepal width and length and petal width and length of different species of iris'.

For more information about the iris dataset, you can find it [here](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/iris.html).

Example Data
========================================================


```r
sample(iris)
```

```
    Sepal.Width Sepal.Length Petal.Length Petal.Width    Species
1           3.5          5.1          1.4         0.2     setosa
2           3.0          4.9          1.4         0.2     setosa
3           3.2          4.7          1.3         0.2     setosa
4           3.1          4.6          1.5         0.2     setosa
5           3.6          5.0          1.4         0.2     setosa
6           3.9          5.4          1.7         0.4     setosa
7           3.4          4.6          1.4         0.3     setosa
8           3.4          5.0          1.5         0.2     setosa
9           2.9          4.4          1.4         0.2     setosa
10          3.1          4.9          1.5         0.1     setosa
11          3.7          5.4          1.5         0.2     setosa
12          3.4          4.8          1.6         0.2     setosa
13          3.0          4.8          1.4         0.1     setosa
14          3.0          4.3          1.1         0.1     setosa
15          4.0          5.8          1.2         0.2     setosa
16          4.4          5.7          1.5         0.4     setosa
17          3.9          5.4          1.3         0.4     setosa
18          3.5          5.1          1.4         0.3     setosa
19          3.8          5.7          1.7         0.3     setosa
20          3.8          5.1          1.5         0.3     setosa
21          3.4          5.4          1.7         0.2     setosa
22          3.7          5.1          1.5         0.4     setosa
23          3.6          4.6          1.0         0.2     setosa
24          3.3          5.1          1.7         0.5     setosa
25          3.4          4.8          1.9         0.2     setosa
26          3.0          5.0          1.6         0.2     setosa
27          3.4          5.0          1.6         0.4     setosa
28          3.5          5.2          1.5         0.2     setosa
29          3.4          5.2          1.4         0.2     setosa
30          3.2          4.7          1.6         0.2     setosa
31          3.1          4.8          1.6         0.2     setosa
32          3.4          5.4          1.5         0.4     setosa
33          4.1          5.2          1.5         0.1     setosa
34          4.2          5.5          1.4         0.2     setosa
35          3.1          4.9          1.5         0.2     setosa
36          3.2          5.0          1.2         0.2     setosa
37          3.5          5.5          1.3         0.2     setosa
38          3.6          4.9          1.4         0.1     setosa
39          3.0          4.4          1.3         0.2     setosa
40          3.4          5.1          1.5         0.2     setosa
41          3.5          5.0          1.3         0.3     setosa
42          2.3          4.5          1.3         0.3     setosa
43          3.2          4.4          1.3         0.2     setosa
44          3.5          5.0          1.6         0.6     setosa
45          3.8          5.1          1.9         0.4     setosa
46          3.0          4.8          1.4         0.3     setosa
47          3.8          5.1          1.6         0.2     setosa
48          3.2          4.6          1.4         0.2     setosa
49          3.7          5.3          1.5         0.2     setosa
50          3.3          5.0          1.4         0.2     setosa
51          3.2          7.0          4.7         1.4 versicolor
52          3.2          6.4          4.5         1.5 versicolor
53          3.1          6.9          4.9         1.5 versicolor
54          2.3          5.5          4.0         1.3 versicolor
55          2.8          6.5          4.6         1.5 versicolor
56          2.8          5.7          4.5         1.3 versicolor
57          3.3          6.3          4.7         1.6 versicolor
58          2.4          4.9          3.3         1.0 versicolor
59          2.9          6.6          4.6         1.3 versicolor
60          2.7          5.2          3.9         1.4 versicolor
61          2.0          5.0          3.5         1.0 versicolor
62          3.0          5.9          4.2         1.5 versicolor
63          2.2          6.0          4.0         1.0 versicolor
64          2.9          6.1          4.7         1.4 versicolor
65          2.9          5.6          3.6         1.3 versicolor
66          3.1          6.7          4.4         1.4 versicolor
67          3.0          5.6          4.5         1.5 versicolor
68          2.7          5.8          4.1         1.0 versicolor
69          2.2          6.2          4.5         1.5 versicolor
70          2.5          5.6          3.9         1.1 versicolor
71          3.2          5.9          4.8         1.8 versicolor
72          2.8          6.1          4.0         1.3 versicolor
73          2.5          6.3          4.9         1.5 versicolor
74          2.8          6.1          4.7         1.2 versicolor
75          2.9          6.4          4.3         1.3 versicolor
76          3.0          6.6          4.4         1.4 versicolor
77          2.8          6.8          4.8         1.4 versicolor
78          3.0          6.7          5.0         1.7 versicolor
79          2.9          6.0          4.5         1.5 versicolor
80          2.6          5.7          3.5         1.0 versicolor
81          2.4          5.5          3.8         1.1 versicolor
82          2.4          5.5          3.7         1.0 versicolor
83          2.7          5.8          3.9         1.2 versicolor
84          2.7          6.0          5.1         1.6 versicolor
85          3.0          5.4          4.5         1.5 versicolor
86          3.4          6.0          4.5         1.6 versicolor
87          3.1          6.7          4.7         1.5 versicolor
88          2.3          6.3          4.4         1.3 versicolor
89          3.0          5.6          4.1         1.3 versicolor
90          2.5          5.5          4.0         1.3 versicolor
91          2.6          5.5          4.4         1.2 versicolor
92          3.0          6.1          4.6         1.4 versicolor
93          2.6          5.8          4.0         1.2 versicolor
94          2.3          5.0          3.3         1.0 versicolor
95          2.7          5.6          4.2         1.3 versicolor
96          3.0          5.7          4.2         1.2 versicolor
97          2.9          5.7          4.2         1.3 versicolor
98          2.9          6.2          4.3         1.3 versicolor
99          2.5          5.1          3.0         1.1 versicolor
100         2.8          5.7          4.1         1.3 versicolor
101         3.3          6.3          6.0         2.5  virginica
102         2.7          5.8          5.1         1.9  virginica
103         3.0          7.1          5.9         2.1  virginica
104         2.9          6.3          5.6         1.8  virginica
105         3.0          6.5          5.8         2.2  virginica
106         3.0          7.6          6.6         2.1  virginica
107         2.5          4.9          4.5         1.7  virginica
108         2.9          7.3          6.3         1.8  virginica
109         2.5          6.7          5.8         1.8  virginica
110         3.6          7.2          6.1         2.5  virginica
111         3.2          6.5          5.1         2.0  virginica
112         2.7          6.4          5.3         1.9  virginica
113         3.0          6.8          5.5         2.1  virginica
114         2.5          5.7          5.0         2.0  virginica
115         2.8          5.8          5.1         2.4  virginica
116         3.2          6.4          5.3         2.3  virginica
117         3.0          6.5          5.5         1.8  virginica
118         3.8          7.7          6.7         2.2  virginica
119         2.6          7.7          6.9         2.3  virginica
120         2.2          6.0          5.0         1.5  virginica
121         3.2          6.9          5.7         2.3  virginica
122         2.8          5.6          4.9         2.0  virginica
123         2.8          7.7          6.7         2.0  virginica
124         2.7          6.3          4.9         1.8  virginica
125         3.3          6.7          5.7         2.1  virginica
126         3.2          7.2          6.0         1.8  virginica
127         2.8          6.2          4.8         1.8  virginica
128         3.0          6.1          4.9         1.8  virginica
129         2.8          6.4          5.6         2.1  virginica
130         3.0          7.2          5.8         1.6  virginica
131         2.8          7.4          6.1         1.9  virginica
132         3.8          7.9          6.4         2.0  virginica
133         2.8          6.4          5.6         2.2  virginica
134         2.8          6.3          5.1         1.5  virginica
135         2.6          6.1          5.6         1.4  virginica
136         3.0          7.7          6.1         2.3  virginica
137         3.4          6.3          5.6         2.4  virginica
138         3.1          6.4          5.5         1.8  virginica
139         3.0          6.0          4.8         1.8  virginica
140         3.1          6.9          5.4         2.1  virginica
141         3.1          6.7          5.6         2.4  virginica
142         3.1          6.9          5.1         2.3  virginica
143         2.7          5.8          5.1         1.9  virginica
144         3.2          6.8          5.9         2.3  virginica
145         3.3          6.7          5.7         2.5  virginica
146         3.0          6.7          5.2         2.3  virginica
147         2.5          6.3          5.0         1.9  virginica
148         3.0          6.5          5.2         2.0  virginica
149         3.4          6.2          5.4         2.3  virginica
150         3.0          5.9          5.1         1.8  virginica
```

The Application
========================================================

To display the use of shiny to build an application, a simple app called the 'Iris Species Predictor Game' was created. It has been deployed [here](https://alimcrich.shinyapps.io/courseproject/). The code for the application can be found on [Github](https://github.com/alimcrich/DevelopingDataProductsCourseProject). 

How to use the App
========================================================

The application allows you to select different variables found within the iris dataset and then guess the species. Selecting the variables shows the different intersection points of these variables on each of the plots and therefore gives you a better idea of what species the iris is. A random forest classifier is then used to see if your answer is correct. The probabilities of each specie given the variables your input are shown in a table once you have clicked 'Submit Species Guess'.

