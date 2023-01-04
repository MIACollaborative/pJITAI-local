INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(1, 'mdot', 'contact@mdot.org', 0x356564306337643534323336313664313865633631623562326266393138386135373236326531623431616163363062396439373937626366633636386362316438393432623838613337303666343766303936376438363039626630363939653733316134663461633438656335316137643561633061313235663966323738386433356462373239313330326632343363333431303662303538323033353339343336663033623833613037336534313637356636343431646338396339);

INSERT INTO `projects` (`created_by`, `uuid`, `general_settings`, `intervention_settings`, `model_settings`, `covariates`, `project_status`, `algo_type`, `modified_on`, `created_on`) VALUES
(1, 'demo-0001', '{\"study_name\": \"HeartSteps Demo\", \"study_description\": \"Practice with HeartSteps using Scenario 1 where you are using published results from an MRT\", \"personalized_scenario\": \"Scenario 1: I have published results from MRT\", \"proximal_outcome_name\": \"(log) Next 30 min step count\", \"personalization_method\": \"Thompson Sampling - Two intervention option\", \"intervention_component_name\": \"Activity suggestion\"}', '{\"update_day\": \"Daily\", \"condition_1\": \"Currently walking or running\", \"condition_2\": \"Finished an activity in the prev 90 min\", \"update_hour\": \"12:00am\", \"intervention_option_a\": \"Activity Suggestion\", \"intervention_option_b\": \"Do Nothing: No activity suggestion\", \"decision_point_frequency\": \"5\", \"decision_point_frequency_time\": \"Day\", \"intervention_probability_lower_bound\": \"0.1\", \"intervention_probability_upper_bound\": \"0.8\"}', '{\"intercept_prior_mean\": \"0\", \"max_proximal_outcome\": \"8.0\", \"min_proximal_outcome\": \"-0.69\", \"treatment_prior_mean\": \"0.13\", \"proximal_outcome_name\": \"(log) Next 30 min step count\", \"proximal_outcome_type\": \"Continuous\", \"intervention_component_name\": \"Activity suggestion\", \"intercept_prior_standard_deviation\": \"10\", \"treatment_prior_standard_deviation\": \"0.07\"}', '{\"2c201b1d-da6c-40e0-9b61-1da2ba81dfb1\": {\"covariate_name\": \"(log) Prior 30 min step count\", \"covariate_type\": \"Continuous\", \"covariate_max_val\": \"8.0\", \"covariate_min_val\": \"-0.69\", \"tailoring_variable\": \"no\", \"proximal_outcome_name\": \"(log) Next 30 min step count\", \"main_effect_prior_mean\": \"0\", \"intervention_component_name\": \"Activity suggestion\", \"main_effect_prior_standard_deviation\": \"10\"}, \"e96b404f-91c1-4f80-9228-96c6b4b2f594\": {\"covariate_name\": \"Location\", \"covariate_type\": \"Binary\", \"covariate_max_val\": \"1\", \"covariate_min_val\": \"0\", \"tailoring_variable\": \"yes\", \"covariate_meaning_0\": \"Home/Work\", \"covariate_meaning_1\": \"Unknown location\", \"proximal_outcome_name\": \"(log) Next 30 min step count\", \"main_effect_prior_mean\": \"0\", \"intervention_component_name\": \"Activity suggestion\", \"interaction_coefficient_prior_mean\": \"0\", \"main_effect_prior_standard_deviation\": \"10\", \"interaction_coefficient_prior_standard_deviation\": \"10\"}}', 0, 'algorithm_type', '2022-12-12 22:55:40', '2022-12-12 20:27:45');
COMMIT;