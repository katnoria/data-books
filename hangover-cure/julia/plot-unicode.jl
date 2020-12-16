using CSV
using DataFrames
using Dates
using UnicodePlots

function load_data(filename)
    df = DataFrame(CSV.File(filename))
    df.dayname = Dates.dayname.(df.Day)
    df.dayofweek = Dates.dayofweek.(df.Day)
    return df
end

function plot(df)    
    xticks = collect(df.Day[1]:Dates.Day(7):df.Day[lastindex(df.Day)])
    # plt = lineplot(df[:, 1], df[:, 2], width=80, title="Data is Beautiful. Hangovers Are Not", ylabel="Google Search Volume (Indexed, 100=Maximum)", color=:green)
    plt = lineplot(df[:, 1], df[:, 2], width=50, title="Data is Beautiful. Hangovers Are Not", ylabel="", color=:green)
    return plt
end

function plot(df, plt)    
    xticks = collect(df.Day[1]:Dates.Day(7):df.Day[lastindex(df.Day)])
    if @isdefined plt
        plt = lineplot!(plt, df[:, 1], df[:, 2], color=:green)
    else
        plt = lineplot(df[:, 1], df[:, 2], width=80, title="Data is Beautiful. Hangovers Are Not", ylabel="Google Search Volume (Indexed, 100=Maximum)")
    end
    # lineplot!(plt, xticks=xticks)
    return plt
end

function weekends(df)
    weekends_df = filter(row -> row[:dayofweek] >= 6, df)
    return weekends_df
end

function vspan_xs(df)
    new_df = DataFrame()
    for row in Tables.rowtable(df)
        push!(new_df, row)
        push!(new_df, row)
    end
    return new_df
end

function vspan_ys(total)
    v = []
    for i in 1:total
        push!(v, 0)
        push!(v, 100)
    end
    return v
end

function plot_vspan(plt, df)
    weekend_df = weekends(df)
    xs = vspan_xs(weekend_df)
    ys = vspan_ys(nrow(weekend_df))
    for i in 1:2:nrow(xs)-1
        lineplot!(plt, xs[i:i+1, 1], ys[i:i+1], color=:red)
        # println(xs[i:i+1, 1], ys[i:i+1])
    end

    annotate!(plt, :r, 1, "🍺 Sat & Sun", color=:red)
    annotate!(plt, :r, 3, "Search Volume", color=:green)

    return plt
end
