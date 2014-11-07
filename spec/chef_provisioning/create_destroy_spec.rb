require 'chef_provisioning_spec_helper'

def test(driver, name = driver, recipe = name)
  it name, :driver => driver do
    expect(metal_run("driver::#{recipe},test::create-destroy").error?).to be false
  end
end

describe 'Create and Destroy' do
  context 'Cloud Drivers', :driver_family => 'cloud' do
    test('fog', 'fog-aws')
    test('fog', 'fog-aws-windows')
    test('aws')
    test('aws', 'aws-windows')
  end

  context 'VM Drivers', :driver_family => 'vm' do
    test('vagrant')
  end

  context 'Container Drivers', :driver_family => 'container' do
    test('docker')
  end
end
