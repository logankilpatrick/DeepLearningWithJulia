module BookTemplate

using Reexport: @reexport
@reexport begin
using Books:
    build_all,
    gen
using DataFrames:
    DataFrame,
    filter!,
    filter,
    select!,
    select
end # @reexport

include("data.jl")
export example_dataframe

"""
    build()

This function is called during CI.
"""
function build()
    println("Building Example Book")
    # To avoid publishing broken websites.
    fail_on_error = true
    gen(; fail_on_error)
    build_all(; fail_on_error)
end

end # module

