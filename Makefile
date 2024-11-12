# build the report
report.html: code/07_render_report.R \
  report.Rmd descriptive_analysis
	Rscript code/07_render_report.R

# create the output of 
# code/01_clean_data_conti.R

data/data_clean_conti.rds: code/01_clean_data_conti.R data/f75_interim.csv
	Rscript code/01_clean_data_conti.R

# code/02_make_plot_conti.R
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

.PHONY: descriptive_analysis_conti
descriptive_analysis: output/plot_agemons.png \
  output/plot_agemons_out.png \
  output/plot_height.png \
  output/plot_weight1.png \
  output/plot_weight1_out.png

.PHONY: clean
clean:
	rm -f data/*.rds output/*.png && \
	rm -f report.html
