# build the report
report.html: code/07_render_report.R report.Rmd descriptive_analysis_conti \
descriptive_analysis_cat regression_analysis
	Rscript code/07_render_report.R

# create the output of code/01_clean_data_conti.R
data/data_clean_conti.rds: code/01_clean_data_conti.R data/f75_interim.csv
	Rscript code/01_clean_data_conti.R

# create the output of code/03_clean_data_cat.R
data/data_clean_cat.rds: code/03_clean_data_cat.R data/f75_interim.csv
	Rscript code/03_clean_data_cat.R

# create the output of code/05_merge_clean_data.R
data/data_clean_merged.rds: code/05_merge_clean_data.R data/data_clean_conti.rds
	Rscript code/05_merge_clean_data.R

# create the output of code/02_make_plot_conti.R
output/plot_agemons.png: code/02_make_plot_conti.R data/data_clean_conti.rds
	Rscript code/02_make_plot_conti.R

output/plot_agemons_out.png: code/02_make_plot_conti.R data/data_clean_conti.rds
	Rscript code/02_make_plot_conti.R

output/plot_height.png: code/02_make_plot_conti.R data/data_clean_conti.rds
	Rscript code/02_make_plot_conti.R

output/plot_weight1.png: code/02_make_plot_conti.R data/data_clean_conti.rds
	Rscript code/02_make_plot_conti.R

output/plot_weight1_out.png: code/02_make_plot_conti.R data/data_clean_conti.rds
	Rscript code/02_make_plot_conti.R

# create the output of code/04_make_plot_cat.R
output/plot_arms.png: code/04_make_plot_cat.R data/data_clean_cat.rds
	Rscript code/04_make_plot_cat.R

output/plot_sex.png: code/04_make_plot_cat.R data/data_clean_cat.rds
	Rscript code/04_make_plot_cat.R

output/plot_bfeeding.png: code/04_make_plot_cat.R data/data_clean_cat.rds
	Rscript code/04_make_plot_cat.R

# regression analysis
output/boxplots.png: data/data_clean_merged.rds
	Rscript code/06_make_boxplots.R

output/both_regression_tables.rds: data/data_clean_merged.rds 
	Rscript code/08_make_models.R
	
# descriptive statistics
output/descriptive_table.rds: data/data_clean_merged.rds
	Rscript code/09_descriptive_table.R

.PHONY: descriptive_analysis_conti
descriptive_analysis_conti: output/plot_agemons.png \
	output/plot_agemons_out.png \
	output/plot_height.png \
	output/plot_weight1.png \
	output/plot_weight1_out.png

.PHONY: descriptive_analysis_cat
descriptive_analysis_cat: output/plot_arms.png \
	output/plot_sex.png \
	output/plot_bfeeding.png

.PHONY: regression_analysis
regression_analysis: output/boxplots.png output/both_regression_tables.rds

.PHONY: clean
clean:
	rm -f data/*.rds output/*.png output/*.rds report.html

# restore a package library
.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"
