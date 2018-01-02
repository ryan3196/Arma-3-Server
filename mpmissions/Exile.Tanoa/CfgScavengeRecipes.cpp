/**
 * CfgScavengeRecipes
 *
 * Author: Steve aka Salutesh
 *
 * Description:
 * These configurations are used within the scavange system to configure the different scavange classes.
 */

class Exile_ScavengeCraftingRecipe
{
	returnedItems[] = {};
	components[] = {}; // Required components
	tools[] = {}; // Required tools (matches, gas cooker etc.)
	weapons[] = {}; // Required weapons (Sledge Hammer)
	requiresOcean = 0; // isSurfaceWater test
	requiresFire = 0; // inflamed object nearby
	requiresConcreteMixer = 0; // Check if concrete mixer is nearby
};

class CfgScavengeRecipes
{
	
};
