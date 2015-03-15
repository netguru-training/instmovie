class ReviewDecorator < Draper::Decorator
  delegate_all

  def creation_time
    "#{I18n.t('decorators.reviews.created_at')}: #{created_at}"
  end
end
