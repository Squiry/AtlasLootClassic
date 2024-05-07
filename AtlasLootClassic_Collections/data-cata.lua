-----------------------------------------------------------------------
-- Upvalued Lua API.
-----------------------------------------------------------------------
local _G = getfenv(0)
local select = _G.select
local string = _G.string
local format = string.format

-- WoW
local function C_Map_GetAreaInfo(id)
	local d = C_Map.GetAreaInfo(id)
	return d or "GetAreaInfo"..id
end

-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local addonname, private = ...
local AtlasLoot = _G.AtlasLoot
if AtlasLoot:GameVersion_LT(AtlasLoot.CATA_VERSION_NUM) then return end
local data = AtlasLoot.ItemDB:Add(addonname, 1, AtlasLoot.CATA_VERSION_NUM)

local AL = AtlasLoot.Locales
local ALIL = AtlasLoot.IngameLocales

local GetForVersion = AtlasLoot.ReturnForGameVersion

local NORMAL_DIFF = data:AddDifficulty("NORMAL", nil, nil, nil, true)
local HEROIC_DIFF = data:AddDifficulty("HEROIC", nil, nil, nil, true)

-- local VENDOR_DIFF = data:AddDifficulty(AL["Vendor"], "vendor", 0)
-- local T10_1_DIFF = data:AddDifficulty(AL["10H / 25 / 25H"], "T10_1", 0)
-- local T10_2_DIFF = data:AddDifficulty(AL["25 Raid Heroic"], "T10_2", 0)


local NORMAL_ITTYPE = data:AddItemTableType("Item", "Item")
local SET_ITTYPE = data:AddItemTableType("Set", "Item")
local AC_ITTYPE = data:AddItemTableType("Item", "Achievement")

local QUEST_EXTRA_ITTYPE = data:AddExtraItemTableType("Quest")
local PRICE_EXTRA_ITTYPE = data:AddExtraItemTableType("Price")
local SET_EXTRA_ITTYPE = data:AddExtraItemTableType("Set")

local VENDOR_CONTENT = data:AddContentType(AL["Vendor"], ATLASLOOT_DUNGEON_COLOR)
local SET_CONTENT = data:AddContentType(AL["Sets"], ATLASLOOT_PVP_COLOR)
--local WORLD_BOSS_CONTENT = data:AddContentType(AL["World Bosses"], ATLASLOOT_WORLD_BOSS_COLOR)
local COLLECTIONS_CONTENT = data:AddContentType(AL["Collections"], ATLASLOOT_COLLECTIONS_COLOR)
local WORLD_EVENT_CONTENT = data:AddContentType(AL["World Events"], ATLASLOOT_SEASONALEVENTS_COLOR)

-- colors
local BLUE = "|cff6666ff%s|r"
--local GREY = "|cff999999%s|r"
local GREEN = "|cff66cc33%s|r"
local _RED = "|cffcc6666%s|r"
local PURPLE = "|cff9900ff%s|r"
--local WHIT = "|cffffffff%s|r"

data["CookingVendorCata"] = {
	name = format(AL["'%s' Vendor"], ALIL["Cooking"]),
	ContentType = VENDOR_CONTENT,
	TableType = NORMAL_ITTYPE,
	gameVersion = AtlasLoot.CATA_VERSION_NUM,
	items = {
		{
			name = AL["Misc"],
			[NORMAL_DIFF] = {
				{ 1, 68689 }, -- Imported Supplies
				{ 16, 65513 }, -- Crate of Tasty Meat
			},
		},
		{
			name = AL["Recipe"],
			[NORMAL_DIFF] = {
				{ 1, 65406 }, -- Recipe: Whitecrest Gumbo
				{ 2, 65407 }, -- Recipe: Lavascale Fillet
				{ 3, 65408 }, -- Recipe: Feathered Lure
				{ 4, 65409 }, -- Recipe: Lavascale Minestrone
				{ 5, 65410 }, -- Recipe: Salted Eye
				{ 6, 65411 }, -- Recipe: Broiled Mountain Trout
				{ 7, 65412 }, -- Recipe: Lightly Fried Lurker
				{ 8, 65413 }, -- Recipe: Seasoned Crab
				{ 9, 65414 }, -- Recipe: Starfire Espresso
				{ 10, 65415 }, -- Recipe: Highland Spirits
				{ 11, 65416 }, -- Recipe: Lurker Lunch
				{ 12, 65417 }, -- Recipe: Pickled Guppy
				{ 13, 65418 }, -- Recipe: Hearty Seafood Soup
				{ 14, 65419 }, -- Recipe: Tender Baked Turtle
				{ 15, 65420 }, -- Recipe: Mushroom Sauce Mudfish
				{ 16, 65421 }, -- Recipe: Severed Sagefish Head
				{ 17, 65422 }, -- Recipe: Delicious Sagefish Tail
				{ 18, 65423 }, -- Recipe: Fish Fry
				{ 19, 65424 }, -- Recipe: Blackbelly Sushi
				{ 20, 65425 }, -- Recipe: Skewered Eel
				{ 21, 65426 }, -- Recipe: Baked Rockfish
				{ 22, 65427 }, -- Recipe: Basilisk Liverdog
				{ 23, 65428 }, -- Recipe: Grilled Dragon
				{ 24, 65429 }, -- Recipe: Beer-Basted Crocolisk
				{ 25, 65430 }, -- Recipe: Crocolisk Au Gratin
				{ 26, 65431 }, -- Recipe: Chocolate Cookie
				{ 27, 65432 }, -- Recipe: Fortune Cookie
				{ 28, 65433 }, -- Recipe: South Island Iced Tea
				{ 29, 68688 }, -- Recipe: Scalding Murglesnout
			},
		},
	}
}

data["JusticePoints"] = {
	name = format(AL["'%s' Vendor"], AL["Justice Points"]),
	ContentType = VENDOR_CONTENT,
	TableType = NORMAL_ITTYPE,
	gameVersion = AtlasLoot.CATA_VERSION_NUM,
	items = {
		{
			name = ALIL["Cloth"],
			[NORMAL_DIFF] = {
				{ 1, 58155 },
				{ 2, 58157 },
				{ 3, 58153 },
				{ 4, 58158 },
				{ 5, 57921 },
				{ 6, 58154 },

				{ 16, 58161 },
				{ 17, 58162 },
				{ 18, 58159 },
				{ 19, 58163 },
				{ 20, 57922 },
				{ 21, 58160 },
			},
		},
		{
			name = ALIL["Leather"],
			[NORMAL_DIFF] = {
				{ 1, 58133 },
				{ 2, 58134 },
				{ 3, 58131 },
				{ 4, 58138 },
				{ 5, 57918 },
				{ 6, 58132 },

				{ 16, 58150 },
				{ 17, 58151 },
				{ 18, 58139 },
				{ 19, 58152 },
				{ 20, 57919 },
				{ 21, 58140 },
			},
		},
		{
			name = ALIL["Mail"],
			[NORMAL_DIFF] = {
				{ 1, 58123 },
				{ 2, 58124 },
				{ 3, 58121 },
				{ 4, 58125 },
				{ 5, 57916 },
				{ 6, 58122 },

				{ 16, 58128 },
				{ 17, 58129 },
				{ 18, 58126 },
				{ 19, 58130 },
				{ 20, 57917 },
				{ 21, 58127 },
			},
		},
		{
			name = ALIL["Plate"],
			[NORMAL_DIFF] = {
				{ 1, 58108 },
				{ 2, 58109 },
				{ 3, 58106 },
				{ 4, 58110 },
				{ 5, 57915 },
				{ 6, 58107 },

				{ 8, 58098 },
				{ 9, 58100 },
				{ 10, 58096 },
				{ 11, 58099 },
				{ 12, 57913 },
				{ 13, 58097 },

				{ 16, 58103 },
				{ 17, 58104 },
				{ 18, 58101 },
				{ 19, 58105 },
				{ 20, 57914 },
				{ 21, 58102 },
			},
		},
		{
			name = ALIL["Weapon"],
			[NORMAL_DIFF] = {
				{ 1, 57925 },
				{ 2, 57926 },
				{ 16, 57923 },
				{ 17, 57924 },
				{ 5, 57928 },
				{ 6, 57929 },
				{ 7, 57927 },
			},
		},
		{
			name = ALIL["Neck"],
			[NORMAL_DIFF] = {
				{ 1, 57934 },
				{ 2, 57933 },
				{ 3, 57932 },
				{ 4, 57931 },
				{ 5, 57930 },
			},
		},
	}
}

data["ValorPoints"] = {
	name = format(AL["'%s' Vendor"], AL["Valor Points"]),
	ContentType = VENDOR_CONTENT,
	TableType = NORMAL_ITTYPE,
	gameVersion = AtlasLoot.CATA_VERSION_NUM,
	items = {
		{
			name = ALIL["Back"],
			[NORMAL_DIFF] = {
				{ 1, 58190 },
				{ 2, 58191 },
				{ 3, 58192 },
				{ 4, 58193 },
				{ 5, 58194 },
			},
		},
		{
			name = ALIL["Feet"],
			[NORMAL_DIFF] = {
				{ 1, 58486 },
				{ 2, 58485 },
				{ 16, 58484 },
				{ 17, 58482 },
				{ 4, 58481 },
				{ 5, 58199 },
				{ 19, 58198 },
				{ 20, 58197 },
				{ 21, 58195 },
			},
		},
		{
			name = ALIL["Finger"],
			[NORMAL_DIFF] = {
				{ 1, 58188 },
				{ 2, 58189 },
				{ 3, 58187 },
				{ 4, 68812 },
				{ 5, 58185 },
			},
		},
		{
			name = ALIL["Relic"],
			[NORMAL_DIFF] = {
				{ 1, 64671 },
				{ 2, 64672 },
				{ 3, 64673 },
				{ 4, 64674 },
				{ 5, 64676 },
			},
		},
		{
			name = ALIL["Trinket"],
			[NORMAL_DIFF] = {
				{ 1, 58183 },
				{ 2, 58184 },
				{ 3, 58182 },
				{ 4, 58180 },
				{ 5, 58181 },
			},
		},
	}
}


data["HeirloomCata"] = {
	name = AL["Heirloom"],
	ContentType = COLLECTIONS_CONTENT,
	LoadDifficulty = LOAD_DIFF,
	TableType = NORMAL_ITTYPE,
	gameVersion = AtlasLoot.CATA_VERSION_NUM,
	items = {
		{
			name = ALIL["Armor"],
			[NORMAL_ITTYPE] = {
				{ 1, 42985 }, -- Tattered Dreadmist Mantle
				{ 2, 44107 }, -- Exquisite Sunderseer Mantle
				{ 16, 48691 }, -- Tattered Dreadmist Robe

				{ 4, 42952 }, -- Stained Shadowcraft Spaulders
				{ 5, 42984 }, -- Preened Ironfeather Shoulders
				{ 6, 44103 }, -- Exceptional Stormshroud Shoulders
				{ 7, 44105 }, -- Lasting Feralheart Spaulders
				{ 19, 48689 }, -- Stained Shadowcraft Tunic
				{ 20, 48687 }, -- Preened Ironfeather Breastplate

				{ 9, 42950 }, -- Champion Herod's Shoulder
				{ 10, 42951 }, -- Mystical Pauldrons of Elements
				{ 11, 44102 }, -- Aged Pauldrons of The Five Thunders
				{ 12, 44101 }, -- Prized Beastmaster's Mantle
				{ 24, 48677 }, -- Champion's Deathdealer Breastplate
				{ 25, 48683 }, -- Mystical Vest of Elements

				{ 14, 42949 }, -- Polished Spaulders of Valor
				{ 15, 44100 }, -- Pristine Lightforge Spaulders
				{ 29, 48685 }, -- Polished Breastplate of Valor
				{ 30, 44099 }, -- Strengthened Stockade Pauldrons
			},
		},
		{
			name = ALIL["Weapon"],
			[NORMAL_ITTYPE] = {
				{ 1, 44096 }, -- Battleworn Thrash Blade
				{ 2, 48716 }, -- Venerable Mass of McGowan
				{ 3, 42944 }, -- Balanced Heartseeker
				{ 4, 44091 }, -- Sharpened Scarlet Kris

				{ 16, 42945 }, -- Venerable Dal'Rend's Sacred Charge
				{ 17, 42948 }, -- Devout Aurastone Hammer
				{ 18, 44094 }, -- The Blessed Hammer of Grace

				{ 6, 42947 }, -- Dignified Headmaster's Charge
				{ 7, 44095 }, -- Grand Staff of Jordan

				{ 21, 42946 }, -- Charmed Ancient Bone Bow
				{ 22, 44093 }, -- Upgraded Dwarven Hand Cannon

				{ 9, 42943 }, -- Bloodied Arcanite Reaper
				{ 11, 48718 }, -- Repurposed Lava Dredger

				{ 24, 44092 }, -- Reforged Truesilver Champion
				{ 25, 38691 }, -- Ancestral Claymore
			},
		},
		{
			name = ALIL["Trinket"],
			[NORMAL_ITTYPE] = {
				{ 1, 42992 }, -- Discerning Eye of the Beast
				{ 2, 42991 }, -- Swift Hand of Justice
			},
		},
		{
			name = ALIL["Finger"],
			[NORMAL_ITTYPE] = {
				{ 1, 50255 }, -- Dread Pirate Ring
			},
		},
		{
			name = AL["Misc"],
			[NORMAL_ITTYPE] = {
				{ 1, 49177 }, -- Tome of Cold Weather Flight
			},
		},
	},
}
