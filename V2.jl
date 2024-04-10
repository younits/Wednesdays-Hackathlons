using Distributions, StatsBase

sim_globe(p, n) = sample(["W", "L"], Weights([p, 1-p]), n)

sim_globe(0.7, 10)

function compute_posterior(samples, ps; outcomes=["W", "L"])
    W, L = [count(x -> x == i, samples) for i in outcomes]
    ways = map(q -> (q*4)^W * ((1-q)*4)^L, ps)
    post = ways / sum(ways)
    return [ps ways post]
end

compute_posterior(sim_globe(0.7, 10), 0:0.25:1)
