get_mle <- function(lines){
	split_lines <- strsplit(grep('generalized stepping', lines, value = T), ' ')[[1]]
	return(as.numeric(split_lines[length(split_lines)]))
}


templates <- paste0('short_sampling_high_rate/', c('GSS_strict_dates_het_rel1_SIMS',
	  'GSS_ucld_dates_het_rel1_SIMS', 'GSS_strict_ultra_het_rel1_SIMS',
	  'GSS_ucld_ultra_het_rel1_SIMS', 'GSS_strict_random_het_rel1_SIMS',
	  'GSS_ucld_random_het_rel1_SIMS'), '.mle.result.log')

plot(c(0,7), c(0, -1400), type = 'n', main = 'Short high rate') 
sims <- paste0('sim_', 1:10)

for(i in 1:length(sims)){
      res_files <- gsub('SIMS', sims[i], templates)
      mles <- vector()
      for(j in 1:length(res_files)){
      	    mles[j] <- get_mle(readLines(res_files[j]))
      }
      offset <- rnorm(1, 0, 0.1)
      lines(1:length(mles)+offset, mles-max(mles), type = 'l')
}
#############
#############
stop('w')
templates <- paste0('bd_dates_low_rate/', c('GSS_strict_dates_utlra_clock_SIMS',
	  'GSS_ucld_dates_utlra_clock_SIMS', 'GSS_strict_ultra_utlra_clock_SIMS',
	  'GSS_ucld_ultra_utlra_clock_SIMS', 'GSS_strict_random_utlra_clock_SIMS',
	  'GSS_ucld_random_utlra_clock_SIMS'), '.mle.result.log')

plot(c(0,7), c(0, -10), type = 'n', main = 'bd low rate') 
sims <- paste0('sim_', 1:10)

for(i in 1:length(sims)){
      res_files <- gsub('SIMS', sims[i], templates)
      mles <- vector()
      for(j in 1:length(res_files)){
      	    mles[j] <- get_mle(readLines(res_files[j]))
      }
      offset <- rnorm(1, 0, 0.1)
      lines(1:length(mles)+offset, mles-max(mles), type = 'l')
      
}
#############
#############

