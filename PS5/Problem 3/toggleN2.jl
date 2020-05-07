include("PhasePortraitV2.jl")

# Function for a biological oscillator
# x1: range of x1 values (i.e. u values)
# x2: range of x2 values (i.e. v values)
# We use `@.` to apply the calculations across all rows.
# Note that model parameters are specified within the function
# Returns computed (dx1/dt, dx2/dt) over the range of (x1, x2)

#x1=[u], and x2=[v], the u,v below correspond with the respective
#time derivatives of the concentration

function toggleMono(x1, x2)
    d = 1                #degradation rate const. for repressor
    a= 10.               #alpha, lumped max rate of generation
    n = 2                #cooperativity constant

    u = @. -d*x1 + a/(1+x2^n)      #eqn 1
    v = @. -d*x2 + a/(1+x1^n)      #eqn 2

    return (u,v)
end

#Range of x1, x2 values
x1range = (0,15,15)          #Has the form (min, max, num points)
x2range = (0,5,15)          #Has the form (min, max, num points)

tspan=(0.0,30.0)             #time span

#Call the phaseplot functon to construct the phase portrait
phaseplot(toggleMono, x1range, x2range, xinit=(), t=tspan, clines=true,
        norm=true, scale=0.5)
