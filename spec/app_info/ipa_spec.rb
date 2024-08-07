describe AppInfo::IPA do
  describe '#iPhone' do
    let(:file) { fixture_path('apps/iphone.ipa') }
    subject { AppInfo::IPA.new(file) }

    after { subject.clear! }

    it { expect(subject.file).to eq file }
    it { expect(subject.format).to eq AppInfo::Format::IPA }
    it { expect(subject.format).to eq :ipa }
    it { expect(subject.manufacturer).to eq(AppInfo::Manufacturer::APPLE) }
    it { expect(subject.manufacturer).to eq(:apple) }
    it { expect(subject.platform).to eq(AppInfo::Platform::IOS) }
    it { expect(subject.platform).to eq(:ios) }
    it { expect(subject.device).to eq(AppInfo::Device::Apple::IPHONE) }
    it { expect(subject.device).to eq(:iphone) }
    it { expect(subject).to be_iphone }
    it { expect(subject).not_to be_ipad }
    it { expect(subject).not_to be_universal }
    it { expect(subject.build_version).to eq('5') }
    it { expect(subject.release_version).to eq('1.2.3') }
    it { expect(subject.name).to eq('AppInfoDemo') }
    it { expect(subject.bundle_name).to eq('AppInfoDemo') }
    it { expect(subject.display_name).to be_nil }
    it { expect(subject.identifier).to eq('com.icyleaf.AppInfoDemo') }
    it { expect(subject.bundle_id).to eq('com.icyleaf.AppInfoDemo') }
    it { expect(subject.min_sdk_version).to eq('9.3') }
    it { expect(subject.info['CFBundleVersion']).to eq('5') }
    it { expect(subject.info[:CFBundleShortVersionString]).to eq('1.2.3') }
    it { expect(subject.archs).to eq(%i[armv7 arm64]) }
    it { expect(subject.icons).to be_kind_of Array }
    it { expect(subject.icons).to be_empty }

    it { expect(subject.release_type).to eq(:adhoc) }
    it { expect(subject.build_type).to eq(:adhoc) }
    it { expect(subject.devices).to be_kind_of Array }
    it { expect(subject.team_name).to eq('QYER Inc') }
    it { expect(subject.profile_name).to eq('iOS Team Provisioning Profile: *') }
    it { expect(subject.expired_date).not_to be_nil }
    it { expect(subject.distribution_name).not_to be_nil }

    it { expect(subject.mobileprovision?).to be true }
    it { expect(subject.mobileprovision.certificates[0]).to be_kind_of AppInfo::Certificate }

    it { expect(subject.metadata).to be_nil }
    it { expect(subject.metadata?).to be false }
    it { expect(subject.stored?).to be false }
    it { expect(subject.info).to be_kind_of AppInfo::InfoPlist }
    it { expect(subject.mobileprovision).to be_kind_of AppInfo::MobileProvision }

    it { expect(subject.plugins).to be_empty }
    it { expect(subject.frameworks).to be_empty }

    it { expect(subject.url_schemes).to eq([]) }
    it { expect(subject.query_schemes).to eq([]) }
    it { expect(subject.background_modes).to eq([]) }
  end

  describe '#iPad' do
    let(:file) { fixture_path('apps/ipad.ipa') }
    subject { AppInfo::IPA.new(file) }

    after { subject.clear! }

    it { expect(subject.file).to eq file }
    it { expect(subject.format).to eq AppInfo::Format::IPA }
    it { expect(subject.format).to eq :ipa }
    it { expect(subject.manufacturer).to eq(AppInfo::Manufacturer::APPLE) }
    it { expect(subject.manufacturer).to eq(:apple) }
    it { expect(subject.platform).to eq(AppInfo::Platform::IOS) }
    it { expect(subject.platform).to eq(:ios) }
    it { expect(subject.device).to eq(AppInfo::Device::Apple::IPAD) }
    it { expect(subject.device).to eq(:ipad) }
    it { expect(subject).not_to be_iphone }
    it { expect(subject).to be_ipad }
    it { expect(subject).not_to be_universal }
    it { expect(subject.build_version).to eq('1') }
    it { expect(subject.release_version).to eq('1.0') }
    it { expect(subject.min_sdk_version).to eq('9.3') }
    it { expect(subject.name).to eq('bundle') }
    it { expect(subject.bundle_name).to eq('bundle') }
    it { expect(subject.display_name).to be_nil }
    it { expect(subject.identifier).to eq('com.icyleaf.bundle') }
    it { expect(subject.bundle_id).to eq('com.icyleaf.bundle') }
    it { expect(subject.archs).to eq(%i[armv7 arm64]) }
    it { expect(subject.icons).to be_kind_of Array }
    it { expect(subject.icons).not_to be_empty }

    it { expect(subject.release_type).to eq(:enterprise) }
    it { expect(subject.build_type).to eq(:enterprise) }
    it { expect(subject.devices).to be_nil }
    it { expect(subject.team_name).to eq('QYER Inc') }
    it { expect(subject.profile_name).to eq('XC: *') }
    it { expect(subject.expired_date).not_to be_nil }
    it { expect(subject.distribution_name).to eq('XC: * - QYER Inc') }

    it { expect(subject.mobileprovision?).to be true }
    it { expect(subject.mobileprovision.certificates[0]).to be_kind_of AppInfo::Certificate }

    it { expect(subject.metadata).to be_nil }
    it { expect(subject.metadata?).to be false }
    it { expect(subject.stored?).to be false }
    it { expect(subject.ipad?).to be true }
    it { expect(subject.info).to be_kind_of AppInfo::InfoPlist }
    it { expect(subject.mobileprovision).to be_kind_of AppInfo::MobileProvision }

    it { expect(subject.info['CFBundleVersion']).to eq('1') }
    it { expect(subject.info.CFBundleVersion).to eq('1') }
    it { expect(subject.info.c_f_bundle_version).to eq('1') }

    it { expect(subject.mobileprovision['TeamName']).to eq('QYER Inc') }
    it { expect(subject.mobileprovision.TeamName).to eq('QYER Inc') }
    it { expect(subject.mobileprovision.team_name).to eq('QYER Inc') }

    it { expect(subject.plugins).to be_empty }
    it { expect(subject.frameworks).to be_empty }

    it { expect(subject.url_schemes).to eq([]) }
    it { expect(subject.query_schemes).to eq([]) }
    it { expect(subject.background_modes).to eq([]) }
  end

  describe '#Universal' do
    let(:file) { fixture_path('apps/embedded.ipa') }
    subject { AppInfo::IPA.new(file) }

    after { subject.clear! }

    it { expect(subject.file).to eq file }
    it { expect(subject.format).to eq AppInfo::Format::IPA }
    it { expect(subject.format).to eq :ipa }
    it { expect(subject.manufacturer).to eq(AppInfo::Manufacturer::APPLE) }
    it { expect(subject.manufacturer).to eq(:apple) }
    it { expect(subject.platform).to eq(AppInfo::Platform::IOS) }
    it { expect(subject.platform).to eq(:ios) }
    it { expect(subject.device).to eq(AppInfo::Device::Apple::UNIVERSAL) }
    it { expect(subject.device).to eq(:universal) }
    it { expect(subject).not_to be_iphone }
    it { expect(subject).not_to be_ipad }
    it { expect(subject).to be_universal }
    it { expect(subject.build_version).to eq('1') }
    it { expect(subject.release_version).to eq('1.0') }
    it { expect(subject.min_sdk_version).to eq('14.3') }
    it { expect(subject.name).to eq('Demo') }
    it { expect(subject.bundle_name).to eq('Demo') }
    it { expect(subject.display_name).to be_nil }
    it { expect(subject.identifier).to eq('com.icyleaf.test.Demo') }
    it { expect(subject.bundle_id).to eq('com.icyleaf.test.Demo') }
    it { expect(subject.archs).to eq(%i[arm64]) }

    it { expect(subject.release_type).to eq(:enterprise) }
    it { expect(subject.build_type).to eq(:enterprise) }
    it { expect(subject.devices).to be_nil }

    it { expect(subject.mobileprovision?).to be true }
    it { expect(subject.mobileprovision.certificates[0]).to be_kind_of AppInfo::Certificate }

    it { expect(subject.metadata).to be_nil }
    it { expect(subject.metadata?).to be false }
    it { expect(subject.stored?).to be false }
    it { expect(subject.ipad?).to be false }
    it { expect(subject.info).to be_kind_of AppInfo::InfoPlist }
    it { expect(subject.mobileprovision).to be_kind_of AppInfo::MobileProvision }

    it { expect(subject.info['CFBundleVersion']).to eq('1') }
    it { expect(subject.info.CFBundleVersion).to eq('1') }
    it { expect(subject.info.c_f_bundle_version).to eq('1') }

    it { expect(subject.plugins).to be_a Array }
    it { expect(subject.plugins.size).to eq 1 }
    it { expect(subject.plugins[0].name).to eq('Notification') }
    it { expect(subject.plugins[0].release_version).to eq('1.0') }
    it { expect(subject.plugins[0].build_version).to eq('1') }
    it { expect(subject.plugins[0].info).to be_a AppInfo::InfoPlist }
    it { expect(subject.plugins[0].bundle_id).to eq('com.icyleaf.test.Demo.Notification') }

    it { expect(subject.frameworks).to be_a Array }
    it { expect(subject.frameworks.size).to eq 1 }
    it { expect(subject.frameworks[0]).to be_a AppInfo::Framework }
    it { expect(subject.frameworks[0].lib?).to be_falsey }
    it { expect(subject.frameworks[0].name).to eq('CarPlay.framework') }
    it { expect(subject.frameworks[0].release_version).to be_nil }
    it { expect(subject.frameworks[0].build_version).to be_nil }
    it { expect(subject.frameworks[0].bundle_id).to be_nil }
    it { expect(subject.frameworks[0].macho).to be_nil }

    it { expect(subject.url_schemes).to eq([]) }
    it { expect(subject.query_schemes).to eq([]) }
    it { expect(subject.background_modes).to eq([]) }
  end

  describe '#AppleTV' do
    let(:file) { fixture_path('apps/apple-tv.ipa') }
    subject { AppInfo::IPA.new(file) }

    after { subject.clear! }

    it { expect(subject.file).to eq file }
    it { expect(subject.format).to eq AppInfo::Format::IPA }
    it { expect(subject.format).to eq :ipa }
    it { expect(subject.manufacturer).to eq(AppInfo::Manufacturer::APPLE) }
    it { expect(subject.manufacturer).to eq(:apple) }
    it { expect(subject.platform).to eq(AppInfo::Platform::APPLETV) }
    it { expect(subject.platform).to eq(:appletv) }
    it { expect(subject.device).to eq(AppInfo::Device::Apple::APPLETV) }
    it { expect(subject.device).to eq(:appletv) }
    it { expect(subject).to be_appletv }
    it { expect(subject).not_to be_iphone }
    it { expect(subject).not_to be_ipad }
    it { expect(subject).not_to be_universal }
    it { expect(subject.build_version).to eq('1') }
    it { expect(subject.release_version).to eq('1.0') }
    it { expect(subject.name).to eq('BilibiliLive') }
    it { expect(subject.bundle_name).to eq('BilibiliLive') }
    it { expect(subject.display_name).to be_nil }
    it { expect(subject.identifier).to eq('com.etan.tv.BilibiliLive.tvOS') }
    it { expect(subject.bundle_id).to eq('com.etan.tv.BilibiliLive.tvOS') }
    it { expect(subject.min_sdk_version).to eq('16.0') }
    it { expect(subject.info['CFBundleVersion']).to eq('1') }
    it { expect(subject.info[:CFBundleShortVersionString]).to eq('1.0') }
    it { expect(subject.archs).to eq(%i[arm64]) }
    it { expect(subject.icons).to be_kind_of Array }
    it { expect(subject.icons).to be_empty }

    it { expect(subject.release_type).to eq(:adhoc) }
    it { expect(subject.build_type).to eq(:adhoc) }

    it { expect(subject.mobileprovision?).to be_truthy }

    it { expect(subject.devices).to be_kind_of Array }
    it { expect(subject.devices.size).to be 1 }
    it { expect(subject.team_name).not_to be_nil }
    it { expect(subject.profile_name).not_to be_nil }
    it { expect(subject.expired_date).not_to be_nil }
    it { expect(subject.distribution_name).not_to be_nil }

    it { expect(subject.metadata).to be_nil }
    it { expect(subject.metadata?).to be false }
    it { expect(subject.stored?).to be false }
    it { expect(subject.info).to be_kind_of AppInfo::InfoPlist }
    it { expect(subject.mobileprovision).to be_kind_of AppInfo::MobileProvision }

    it { expect(subject.plugins).to be_empty }
    it { expect(subject.frameworks).to be_empty }

    it { expect(subject.url_schemes).to eq([]) }
    it { expect(subject.query_schemes).to eq([]) }
    it { expect(subject.background_modes).to eq([]) }
  end
end
