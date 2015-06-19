PROJECTILE_THINK = 0.03

if CustomProjectileManager == nil then
  print ( '[CP] creating CustomProjectileManager' )
  CustomProjectileManager = {}
  CustomProjectileManager.__index = CustomProjectileManager
end

function CustomProjectileManager:new( o )
  o = o or {}
  setmetatable( o, CustomProjectileManager )
  return o
end

function CustomProjectileManager:start()
  CustomProjectileManager = self
  self.projectiles = {}
end

function CustomProjectileManager:CreateBoomerangProjectile( info )

	return 0
end

CustomProjectileManager:start()