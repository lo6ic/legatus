class Enemy < Entity
  attr_accessor :physics

  TEAM = 0

  def initialize(x, y)
    @team = Enemy::TEAM
    super(x, y, image.width, image.height)
  end

  def update(_)
    physics.update(self, EnemyInput.new, screen)
  end

  def draw
    image.draw(x, y, 0)
  end

  def removable?
    x > screen.h || super
  end

  def before_removal
    Gosu::Sample.new("media/explosion.wav").play
  end

  private

  attr_reader :image, :screen

  def image
    @image ||= Gosu::Image.new('media/enemy.png')
  end
end
