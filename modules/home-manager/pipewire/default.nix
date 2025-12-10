{ pkgs, ... }:
{
  xdg.configFile."wireplumber/wireplumber.conf.d/51-default-devices.conf" = {
    text = ''
      monitor.alsa.rules = [
        {
          matches = [
            {
              node.name = "~alsa_input.usb-0c76_USB_PnP_Audio_Device.*"
            }
          ]
          actions = {
            update-props = {
              priority.session = 1000
            }
          }
        }
      ]
    '';
  };

  xdg.configFile."pipewire/pipewire.conf.d/99-deepfilternet.conf" = {
    text = builtins.toJSON {
      "context.properties" = {
        "link.max-buffers" = 16;
        "core.daemon" = true;
        "core.name" = "pipewire-0";
        "module.x11.bell" = false;
        "module.access" = true;
        "module.jackdbus-detect" = false;
      };

      "context.modules" = [
        {
          name = "libpipewire-module-filter-chain";
          args = {
            "node.description" = "DeepFilter Noise Canceling source";
            "media.name" = "DeepFilter Noise Canceling source";

            "filter.graph" = {
              nodes = [
                {
                  type = "ladspa";
                  name = "DeepFilter Mono";
                  plugin = "${pkgs.deepfilternet}/lib/ladspa/libdeep_filter_ladspa.so";
                  label = "deep_filter_mono";
                  control = {
                    "Attenuation Limit (dB)" = 100;
                  };
                }
              ];
            };

            "audio.rate" = 48000;
            "audio.position" = "[MONO]";

            "capture.props"."node.passive" = true;
            "playback.props"."media.class" = "Audio/Source";
          };
        }
      ];
    };
  };
}
