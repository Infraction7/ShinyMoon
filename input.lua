local a = {"Hello", "World"}
-- hello world
local i = 1
while i <= #a do
	if a ~= "Hello" then
		print("World")
	else
		print(a[i])
	end
	i = i + 1
end