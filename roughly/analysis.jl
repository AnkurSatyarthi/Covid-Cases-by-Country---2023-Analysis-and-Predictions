using DataFrames, CSV, Plots, TypedTables, GLM
covid_cases = DataFrame(CSV.File("data/WorldCases2023.csv"))
describe(covid_cases)
#logistic regression or classification
gr(size=(600,600));logistic(x) = 1/(1+exp(-x))
p_logistic=plot(-6:0.1:6,logistic,xlabel="Inputs(x)",ylabel="Outputs(y)",title="Logistic(Sigmoid)Curve",legend=false,color=:blue)
# modify logistic Curve
# initialize parameters
theta_0=0.0 # y-intercept (default=0|try 1 & -1)
theta_1=1.0 # slope (default = 1|try 0.5&-0.5)
# Hypothesis function
z(x)=theta_0 .+ theta_1 * x
h(x) = 1 ./ (1 .+ exp.(-z(x)))
# re-plot
plot!(h,color=:red,linestyle=:dash)
