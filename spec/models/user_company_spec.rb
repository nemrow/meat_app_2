require 'spec_helper'

describe UserCompany do
  it { should belong_to(:user) }
  it { should belong_to(:company) }
end
