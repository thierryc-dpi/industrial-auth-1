class PhotoPolicy < ApplicationPolicy
  attr_reader :user, :photo

  def initialize(user, photo)
    @user = user
    @photo = photo
  end

  def new?
    user.present?
  end

  def create?
    new?
  end

  def show?
    user == photo.owner ||
      !photo.owner.private? ||
      photo.owner.followers.include?(user)
  end

  def edit?
    user == photo.owner
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end

end
