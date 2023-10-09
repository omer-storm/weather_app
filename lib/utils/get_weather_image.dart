String getWeatherImage(String weather) {
  switch (weather) {
    case "Thunderstorm":
      return "https://wallpapercave.com/wp/wp3348283.jpg";
    case "Drizzle":
      return "https://c4.wallpaperflare.com/wallpaper/544/546/353/drizzle-night-bokeh-lights-light-wallpaper-preview.jpg";
    case "Rain":
      return "https://wallpaperboat.com/wp-content/uploads/2020/03/rain-01.jpg";
    case "Snow":
      return "https://wallpaperaccess.com/full/1473022.jpg";
    case "Atmosphere":
      return "https://wallpapers.com/images/hd/mobile-phone-736-x-1308-background-h60waxxddtgby4qq.jpg";
    case "Clear":
      return "https://w0.peakpx.com/wallpaper/114/51/HD-wallpaper-blue-sky-background-blue-clouds-slender.jpg";
    case "Clouds":
      return "https://images.pexels.com/photos/3941855/pexels-photo-3941855.jpeg?cs=srgb&dl=pexels-alex-conchillos-3941855.jpg&fm=jpg";
    case "Haze":
      return "https://w0.peakpx.com/wallpaper/328/184/HD-wallpaper-foggy-forest-fog-dark.jpg";
    default:
      return "https://w0.peakpx.com/wallpaper/20/604/HD-wallpaper-black-screen-solid-dark-plain-all-phone-pure-noir-colors.jpg";
  }
}
