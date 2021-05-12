module SampleChainsContinuous

using ZigZagBoomerang
using Reexport
@reexport using SampleChains
using NestedTuples
using ElasticArrays
using ConcreteStructs
using TransformVariables
using MappedArrays
using Random
using ZigZagBoomerang

# using SampleChains: chainvec

export ContinuousChain


@concrete struct  ContinuousChain{T} <: AbstractChain{T}
    samples     # :: AbstractVector{T}
    logq        # log-density for distribution the sample was drawn from
    info        # Per-sample metadata, type depends on sampler used
    meta        # Metadata associated with the sample as a whole
    state       
    transform
end

# function ContinuousChain(t::TransformVariables.TransformTuple, Q::DynamicHMC.EvaluatedLogDensity, tree_stats, steps)
#     tQq = TransformVariables.transform(t, Q.q)
#     T = typeof(tQq)
#     samples = chainvec(tQq)
#     logq = chainvec(Q.ℓq)
#     info = chainvec(tree_stats)
#     meta = steps
#     transform = t

#     return ContinuousChain{T}(samples, logq, info, meta, Q, transform)
# end

# SampleChains.summarize(ch::ContinuousChain) = summarize(samples(ch))

# function gettransform(chain::ContinuousChain)
#     return getfield(chain, :transform)
# end

# function SampleChains.pushsample!(chain::ContinuousChain, Q::DynamicHMC.EvaluatedLogDensity, tree_stats)
#     push!(samples(chain), transform(gettransform(chain), Q.q))
#     push!(logq(chain), Q.ℓq)
#     push!(info(chain), tree_stats)
# end

# function SampleChains.step!(chain::ContinuousChain)
#     Q, tree_stats = DynamicHMC.mcmc_next_step(getfield(chain, :meta), getfield(chain, :state))
# end

# function SampleChains.initialize!(rng::Random.AbstractRNG, ::Type{ContinuousChain}, ℓ, tr, ad_backend=Val(:ForwardDiff))

#     results = DynamicHMC.mcmc_keep_warmup(
#         rng,
#         ∇P,
#         0;
#         reporter = reporter
#     )

#     steps = DynamicHMC.mcmc_steps(
#         results.sampling_logdensity,
#         results.final_warmup_state,
#     )
    
#     Q = results.final_warmup_state.Q
#     Q, tree_stats = DynamicHMC.mcmc_next_step(steps, Q)
#     chain = ContinuousChain(tr, Q, tree_stats, steps)
# end

# function SampleChains.initialize!(::Type{ContinuousChain}, ℓ, tr, ad_backend=Val(:ForwardDiff))
#     rng = Random.GLOBAL_RNG
#     return initialize!(rng, ContinuousChain, ℓ, tr, ad_backend)
# end

# function SampleChains.drawsamples!(chain::ContinuousChain, n::Int=1000)
#     @cleanbreak for j in 1:n
#         Q, tree_stats = step!(chain)
#         pushsample!(chain, Q, tree_stats)
#     end 
#     return chain
# end


end
