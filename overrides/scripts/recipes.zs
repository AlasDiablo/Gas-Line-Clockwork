import crafttweaker.api.item.IIngredient;

// [START] Age 1 - Black iron ingot ----------------------------------------------------------------------------------------------------------------------------------------
craftingTable.removeRecipe(<item:extendedcrafting:black_iron_ingot>);
craftingTable.removeRecipe(<item:extendedcrafting:redstone_ingot>);

craftingTable.addShaped("black_iron_ingot", <item:extendedcrafting:black_iron_ingot>, [
    [<item:exnihilosequentia:pebble_blackstone>, <item:exnihilosequentia:pebble_blackstone>, <item:exnihilosequentia:pebble_blackstone>], 
    [<item:exnihilosequentia:pebble_blackstone>, <item:minecraft:iron_ingot>, <item:exnihilosequentia:pebble_blackstone>], 
    [<item:exnihilosequentia:pebble_blackstone>, <item:exnihilosequentia:pebble_blackstone>, <item:exnihilosequentia:pebble_blackstone>]
]);

craftingTable.addShapeless("black_iron_ingot_from_block", <item:extendedcrafting:black_iron_ingot> * 9, [<item:extendedcrafting:black_iron_block>]);

craftingTable.addShaped("black_iron_ingot_from_nugget", <item:extendedcrafting:black_iron_ingot>, [
    [<item:extendedcrafting:black_iron_nugget>, <item:extendedcrafting:black_iron_nugget>, <item:extendedcrafting:black_iron_nugget>], 
    [<item:extendedcrafting:black_iron_nugget>, <item:extendedcrafting:black_iron_nugget>, <item:extendedcrafting:black_iron_nugget>], 
    [<item:extendedcrafting:black_iron_nugget>, <item:extendedcrafting:black_iron_nugget>, <item:extendedcrafting:black_iron_nugget>]
]);
// [END] Age 1 - Black iron ingot ------------------------------------------------------------------------------------------------------------------------------------------

// [START] Age 1 - Create --------------------------------------------------------------------------------------------------------------------------------------
craftingTable.removeRecipe(<item:create:andesite_alloy>);
mods.extendedcrafting.TableCrafting.addShaped("andesite_alloy_from_iron", 1, <item:create:andesite_alloy>, [
    [<item:minecraft:iron_nugget>, <item:minecraft:andesite>],
    [<item:minecraft:andesite>, <item:minecraft:iron_nugget>]
]);
mods.extendedcrafting.TableCrafting.addShaped("andesite_alloy_from_zinc", 1, <item:create:andesite_alloy>, [
    [<item:create:zinc_nugget>, <item:minecraft:andesite>],
    [<item:minecraft:andesite>, <item:create:zinc_nugget>]
]);
// [END] Age 1 - Create ----------------------------------------------------------------------------------------------------------------------------------------

for recipe in craftingTable.getAllRecipes() {
    if (recipe.id.namespace == "ironchest" || recipe.id.namespace == "create") {
        var size = 3;
        var x = 0;
        var y = 0;
        var list = [
            [<item:minecraft:air>, <item:minecraft:air>, <item:minecraft:air>],
            [<item:minecraft:air>, <item:minecraft:air>, <item:minecraft:air>],
            [<item:minecraft:air>, <item:minecraft:air>, <item:minecraft:air>],
        ] as IIngredient[][];

        if (recipe.canFit(1, 3)) {
            size = 1;
        }

        if (recipe.canFit(2, 3)) {
            size = 2;
        }

        println(">" + recipe.id);
        for ingredient in recipe.ingredients {
            println(ingredient.commandString);
            if (x == size) {
                x = 0;
                y = y + 1;
            }
            list[x][y] = ingredient;
            
            x = x + 1;
        }
        mods.extendedcrafting.TableCrafting.addShaped(recipe.id.path, 1, recipe.output, list);
    }
}
