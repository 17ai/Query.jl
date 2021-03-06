using DataFrames, Query, TypedTables

df1 = DataFrame(a=[1,2,3], b=[1.,2.,3.])
df2 = @Table(c=[2.,4.,2.], d=["John", "Jim","Sally"])

x = @from i in df1 begin
    @join j in df2 on get(i.a) equals convert(Int,j.c)
    @select {i.a,i.b,j.c,j.d,e="Name: $(j.d)"}
    @collect DataFrame
end

println(x)
