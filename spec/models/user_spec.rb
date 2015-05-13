require 'spec_helper'

describe User, type: :model do
  it { is_expected.to belong_to :cohort }
end