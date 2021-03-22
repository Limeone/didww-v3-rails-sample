# frozen_string_literal: true
class AddressVerificationDecorator < ResourceDecorator
  decorates_association :address, with: AddressDecorator
  delegate :country, to: :address, prefix: true, allow_nil: true
  delegate :identity, to: :address, allow_nil: true
  delegate :country, to: :identity, prefix: true, allow_nil: true

  def identity_link
    return if model.nil? || identity.nil?

    h.link_to identity.display_name, h.identity_path(identity.id)
  end

  def address_link
    return if model.nil? || address.nil?

    h.link_to address.display_name, h.address_path(address.id)
  end

  def link
    return if model.nil?

    h.link_to model.id, h.address_verification_path(model.id)
  end

  def created_at
    format_time model.created_at
  end
end
