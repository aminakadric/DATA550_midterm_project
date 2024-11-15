This repository carries the midterm project of __DATA 550: Data Science Toolkit (Fall 2024)__ at Emory University.

To generate the report, navigate to the main project folder and simply run `make` in the terminal. This command will sequentially clean the data, perform the analysis, and render the final report.

The report is customizable in terms of its format and statistical analysis. There is a *config.yml* file in the main project folder that allows for two configurations:

* Default mode, where the code will not be displayed in the final report. Besides, in the logistic regression analysis, the cutoff for binarizing the `weight` variable is set to 6.

* Test mode, where the code will be displayed in the final report. Besides, in the logistic regression analysis, the cutoff for binarizing the `weight` variable is set to 8.