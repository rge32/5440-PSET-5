include("PhasePortraitV2.jl")

# Function for a biological oscillator
# x1: range of x1 values (i.e. A values)
# x2: range of x2 values (i.e. R values)
# We use `@.` to apply the calculations across all rows.
# Note that model parameters are specified within the function
# Returns computed (dx1/dt, dx2/dt) over the range of (x1, x2)
function toggleMono(x1, x2)
    da = 30               #degradation rate const. for repressor 1
    roa = 100              #basal generation rate of repressor 1
    ror= 1.0               #basal generation rate of repressor 2
    ra = 5000               #activated generation rate of repressor 1
    rr= 100              #activated generation  rate of repressor 2


    u = @. -da*x1 + (roa + ra*x1^2)/(1+x1^2+x2^2) #eqn 11
    v = @. -x2 + (ror + rr*x1^2)/(1+x1^2)   #eqn 12

    return (u,v)
end

#Range of x1, x2 values
x1range = (0,200,15)          #Has the form (min, max, num points)
x2range = (0,100,15)          #Has the form (min, max, num points)
x₀  = ([1.0,10.0],)  #initial state vectors; a common must be included after the first array
tspan=(0.0,30.0)             #time span

#Call the phaseplot functon to construct the phase portrait
phaseplot(toggleMono, x1range, x2range, xinit=(), t=tspan, clines=true,
        norm=true, scale=0.5)
