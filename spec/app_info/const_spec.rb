describe AppInfo::Manufacturer do
  it { expect(AppInfo::Manufacturer::APPLE).to eq :apple }
  it { expect(AppInfo::Manufacturer::GOOGLE).to eq :google }
  it { expect(AppInfo::Manufacturer::MICROSOFT).to eq :microsoft }
end

describe AppInfo::Platform do
  it { expect(AppInfo::Platform::MACOS).to eq :macos }
  it { expect(AppInfo::Platform::IOS).to eq :ios }
  it { expect(AppInfo::Platform::ANDROID).to eq :android }
  it { expect(AppInfo::Platform::WINDOWS).to eq :windows }
end

describe AppInfo::Device do
  it { expect(AppInfo::Device::Apple::MACOS).to eq :macos }
  it { expect(AppInfo::Device::Apple::IPHONE).to eq :iphone }
  it { expect(AppInfo::Device::Apple::IPAD).to eq :ipad }
  it { expect(AppInfo::Device::Apple::IWATCH).to eq :iwatch }
  it { expect(AppInfo::Device::Apple::UNIVERSAL).to eq :universal }
  it { expect(AppInfo::Device::Google::PHONE).to eq :phone }
  it { expect(AppInfo::Device::Google::TABLET).to eq :tablet }
  it { expect(AppInfo::Device::Google::WATCH).to eq :watch }
  it { expect(AppInfo::Device::Google::TELEVISION).to eq :television }
  it { expect(AppInfo::Device::Google::AUTOMOTIVE).to eq :automotive }
  it { expect(AppInfo::Device::Microsoft::WINDOWS).to eq :windows }
end
