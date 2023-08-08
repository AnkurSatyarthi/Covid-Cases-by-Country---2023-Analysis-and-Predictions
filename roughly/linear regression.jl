using DataFrames, CSV, Plots, TypedTables, GLM
covid_cases = DataFrame(CSV.File("data/WorldCases2023.csv"))
describe(covid_cases)
# X=round.(Int,covid_cases.TotalCases/1000);describe(X);Y=covid_cases.TotalDeaths;describe(Y);t=Table(X=X,Y=Y)
X=covid_cases.TotalCases;describe(X);Y=covid_cases.TotalDeaths;describe(Y);t=Table(X=X,Y=Y)
# use Plots package to generate scatter plot of data
gr(size=(600,600))
# create scatter plot
p_scatter=scatter(X,Y,xlims=(9,70000000),ylims=(1,7000000),xlabel="Total Covid Cases",legend=false,color=:red);ols=lm(@formula(Y~X),t)
plot!(X,predict(ols),color=:green,linewidth=11)
newX=Table(X=[1250])
predict(ols,newX)