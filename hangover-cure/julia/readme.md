
# Unicode

Open Julia REPL

```
include("./plot-unicode.jl")
df = load_data("../../hangover-cure/data/us-90days.csv")
# simple plot
plt = plot(df)
# add vspan
plot_vspan(plt, df)
```