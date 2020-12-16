### A Pluto.jl notebook ###
# v0.11.14

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 46f5b944-052e-11eb-0b37-d5300eed0dcf
begin
	using Pkg
	Pkg.add("PlutoUI")
	Pkg.add("Formatting")
	using PlutoUI
	using CSV
	using DataFrames
	using Formatting	
end

# ╔═╡ ec894576-02f2-11eb-35a1-b54a763d5020
md"# 🧬 Length of the Unrolled Human DNA 

There are approx. 30 trillion cells in the human body. Every cell contains the DNA in its nucleus ([except some](https://wtamu.edu/~cbaird/sq/2013/08/22/why-does-every-cell-in-our-body-contain-dna/)). The unrolled DNA is around 2 meters long 🤯. Now, that is one hell of compaction.

Nature is the ultimate computer scientist.

"

# ╔═╡ ea2d2a0e-02f2-11eb-3db2-53747e1c5fef
# We setup some data in this block
begin
	num_cells = 70e12
	dna_length_metres = 2
	dna_length_km = 2/1000
	human_total_dna_km = dna_length_km * num_cells
	world_population = 7.8e12
end

# ╔═╡ d9c30548-02f3-11eb-0a52-47a9743386fb
md"The average number of cells in the human body is $(format(num_cells, commas=true))"

# ╔═╡ f6f903ec-02f3-11eb-1369-adddbbc08448
md"Total Human DNA ~ DNA Length x Cells in human body:  $(format(human_total_dna_km, commas=true)) KM"

# ╔═╡ a794ceae-0563-11eb-216a-53c433d9efe5
md"\"Amazing isn't it\", I said and expected it to end.

But, share this fact with the kids and see if it ends there.

Almost immediately, the questions will start to roll in....
"

# ╔═╡ 22321d50-02f4-11eb-37e4-9919d5e2d8f2
md"#### Q: If we unrolled the DNA from every cell of the living human and joined together, would it reach the Andromeda galaxy?
"

# ╔═╡ 06b7da50-0552-11eb-174e-2d8e1bd5fe8e
md"[Andromeda](https://en.wikipedia.org/wiki/Andromeda_Galaxy) is about 2.537 million light years from our home planet (and is on the [collision path](https://en.wikipedia.org/wiki/Andromeda%E2%80%93Milky_Way_collision) with our galaxy, in some 4.5 billion years)."

# ╔═╡ 3aeb5032-053f-11eb-2946-a7b9007195d4
md"
![](https://apod.nasa.gov/apod/image/1407/m31_bers_1824.jpg)
Image: NASA
"

# ╔═╡ e142105e-0300-11eb-347a-3b7b00da92fe
md"Let's find out."

# ╔═╡ bb038ac8-02fe-11eb-26a4-2d9291eed60f
begin
	light_year_km=9.461e12
	andromeda_distance=2.537e6
	andromeda_distance_km = light_year_km * andromeda_distance
end	;

# ╔═╡ a2cedd56-054f-11eb-0fa9-ed4a9cd82a94
md"Is the distance between Earth and Andromeda greater than the length of DNA from a single human?"

# ╔═╡ 2b3b24e0-02ff-11eb-2acb-af4c5180971f
andromeda_distance_km > human_total_dna_km

# ╔═╡ a87b8686-02f3-11eb-2a4b-156f41effb1d
mankind_dna_km = world_population * human_total_dna_km;

# ╔═╡ 6a8b0d82-02f4-11eb-37ad-9d1034b9b61f
md"Is the total Human DNA from all living Humans long enough to reach the Andromeda galaxy ? 

Answer: $(mankind_dna_km >= andromeda_distance_km)"

# ╔═╡ ea38596e-02f8-11eb-0be4-836ed35af793
md"In fact, it is **$(format(round(mankind_dna_km/andromeda_distance_km), commas=true))** times the distance of Andromeda."

# ╔═╡ 7218783a-0538-11eb-2450-d7a9cfd7d91e
md"---"

# ╔═╡ db135b2a-054e-11eb-34c5-9bdd1526d5f4
md"Alright, so we know that the sum total length of every living human DNA is quite large. Some might say its Bigly."

# ╔═╡ 85e33882-053f-11eb-3893-85e54bfb6008
md"## Milky Way

#### Q: Is it longer than the length of our Galaxy?
"

# ╔═╡ 288b1584-053e-11eb-3bb4-898304daa9e2
md"
![](https://asd.gsfc.nasa.gov/blueshift/wp-content/uploads/2015/07/eso0932a.jpg)
Image: NASA
"

# ╔═╡ 77f90bde-053f-11eb-33aa-1d0485c98c9e
md"## Observable Universe

#### Q: It surely is going to be a lot less than the Universe?
"

# ╔═╡ 642f67b0-053f-11eb-1c04-41eab0f26fff
md"
![](https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Observable_Universe_Logarithmic_Map_%28horizontal_layout_english_annotations%29.png/2250px-Observable_Universe_Logarithmic_Map_%28horizontal_layout_english_annotations%29.png)
Image: Wikipedia
"

# ╔═╡ 9025091a-053f-11eb-38c0-a1754bcc23bf
md"## Extras

At this point, the tiny inbestigators started asking all sorts of question such as what if you only take the population of Maldives or India. How far will it take us?
"

# ╔═╡ a5aefac2-0565-11eb-29a5-45c409441b18
md"So, I gave them this. Go Play."

# ╔═╡ c3d2c5fa-0534-11eb-1ce2-f11fc7384a7c
md"Total length of DNA from the population of"

# ╔═╡ 6ab56e86-05ee-11eb-3a30-772a9e9a28ae
md"*Note: The interactive version will only work in the Pluto notebook*"

# ╔═╡ eed77dfa-053d-11eb-3ee0-6dc3cb973fbe
md"---"

# ╔═╡ dd33494e-053d-11eb-0c78-9f9ce7c643fe
md"**Setup Section**"

# ╔═╡ 50a55d3c-052e-11eb-0e94-f9562da4db97
# Datasource: https://data.worldbank.org/indicator/SP.POP.TOTL
world_pop = DataFrame(CSV.File("world_population_2019.csv"));

# ╔═╡ 888e99a4-0531-11eb-3bc3-8d847053be75
@bind country Select(vcat(world_pop[:,"Country Name"], "1 Human"))

# ╔═╡ 20df1f62-0534-11eb-275b-4b15029abe44
function pop_to_dna(population)
	 return population * human_total_dna_km
end

# ╔═╡ 7a16cfac-0533-11eb-3868-c36178506bc3
planet_distances_km = DataFrame(CSV.File("earth_distance.csv"));

# ╔═╡ b0a7118c-0534-11eb-04cb-3f273d884de3
@bind planet Select(planet_distances_km[:, "Name"])

# ╔═╡ 1fcf05c4-0535-11eb-2a29-fdd822b3f685
begin
	if country == "1 Human"
		current_pop = 1
	else
		idx = findfirst(x -> x == country, world_pop[:, "Country Name"])
		current_pop = world_pop[idx,"2019"]		
	end
	planet_idx = findfirst(x -> x == planet, planet_distances_km[:, "Name"])	
	planet_distance = planet_distances_km[planet_idx, "Distance_KM"]
	distance_times = pop_to_dna(current_pop)/planet_distance
end;

# ╔═╡ d0c06a54-0534-11eb-2f55-134fe93a4e20
md" is $(format(distance_times, commas=true)) times the distance from Earth to "

# ╔═╡ a2caf1bc-0531-11eb-28ac-41ab5b064e33
md"Population of $(uppercase(country)) is $(current_pop)"

# ╔═╡ f90bb6ce-0533-11eb-02b5-95ddddb853d6
# Width of Milky Way
milkyway_width_km = 105700 * light_year_km

# ╔═╡ 042f4fc0-02f5-11eb-05b5-b5452bc3d81c
md"

The width of Milky Way is **$(format(milkyway_width_km, commas=true))** KM. 

We could go from one end of the Milky way to another $(format(mankind_dna_km/milkyway_width_km, commas=true)) times, for that amount of DNA.
"

# ╔═╡ 49e46e4a-0536-11eb-1d2a-cfcb1dbbf9fc
observable_universe_km = 93e9 * light_year_km

# ╔═╡ 0744796a-0539-11eb-0f1c-6bbcd56c3e02
md"The observable Universe is $(observable_universe_km) KM. And it is approximately the same length as the total length of entire world population DNA."

# ╔═╡ e6d30c24-053c-11eb-0226-b94f320cdeb1
md"Approximately ~ $(format( mankind_dna_km/observable_universe_km, commas=true )) times"

# ╔═╡ Cell order:
# ╟─ec894576-02f2-11eb-35a1-b54a763d5020
# ╠═ea2d2a0e-02f2-11eb-3db2-53747e1c5fef
# ╟─d9c30548-02f3-11eb-0a52-47a9743386fb
# ╟─f6f903ec-02f3-11eb-1369-adddbbc08448
# ╟─a794ceae-0563-11eb-216a-53c433d9efe5
# ╟─22321d50-02f4-11eb-37e4-9919d5e2d8f2
# ╟─06b7da50-0552-11eb-174e-2d8e1bd5fe8e
# ╟─3aeb5032-053f-11eb-2946-a7b9007195d4
# ╟─e142105e-0300-11eb-347a-3b7b00da92fe
# ╟─bb038ac8-02fe-11eb-26a4-2d9291eed60f
# ╟─a2cedd56-054f-11eb-0fa9-ed4a9cd82a94
# ╠═2b3b24e0-02ff-11eb-2acb-af4c5180971f
# ╟─a87b8686-02f3-11eb-2a4b-156f41effb1d
# ╟─6a8b0d82-02f4-11eb-37ad-9d1034b9b61f
# ╟─ea38596e-02f8-11eb-0be4-836ed35af793
# ╟─7218783a-0538-11eb-2450-d7a9cfd7d91e
# ╟─db135b2a-054e-11eb-34c5-9bdd1526d5f4
# ╟─85e33882-053f-11eb-3893-85e54bfb6008
# ╟─288b1584-053e-11eb-3bb4-898304daa9e2
# ╟─042f4fc0-02f5-11eb-05b5-b5452bc3d81c
# ╟─77f90bde-053f-11eb-33aa-1d0485c98c9e
# ╟─642f67b0-053f-11eb-1c04-41eab0f26fff
# ╟─0744796a-0539-11eb-0f1c-6bbcd56c3e02
# ╟─e6d30c24-053c-11eb-0226-b94f320cdeb1
# ╟─9025091a-053f-11eb-38c0-a1754bcc23bf
# ╟─a5aefac2-0565-11eb-29a5-45c409441b18
# ╟─c3d2c5fa-0534-11eb-1ce2-f11fc7384a7c
# ╟─888e99a4-0531-11eb-3bc3-8d847053be75
# ╟─d0c06a54-0534-11eb-2f55-134fe93a4e20
# ╟─b0a7118c-0534-11eb-04cb-3f273d884de3
# ╟─a2caf1bc-0531-11eb-28ac-41ab5b064e33
# ╟─6ab56e86-05ee-11eb-3a30-772a9e9a28ae
# ╟─eed77dfa-053d-11eb-3ee0-6dc3cb973fbe
# ╟─dd33494e-053d-11eb-0c78-9f9ce7c643fe
# ╠═46f5b944-052e-11eb-0b37-d5300eed0dcf
# ╠═50a55d3c-052e-11eb-0e94-f9562da4db97
# ╠═1fcf05c4-0535-11eb-2a29-fdd822b3f685
# ╠═20df1f62-0534-11eb-275b-4b15029abe44
# ╠═7a16cfac-0533-11eb-3868-c36178506bc3
# ╠═f90bb6ce-0533-11eb-02b5-95ddddb853d6
# ╠═49e46e4a-0536-11eb-1d2a-cfcb1dbbf9fc
