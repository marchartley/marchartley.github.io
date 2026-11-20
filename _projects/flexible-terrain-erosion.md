---
title: "Particle-based terrain erosion"
collection: projects
permalink: /projects/flexible-terrain-erosion/
order: 2
excerpt: "One erosion method for height fields, voxel grids, material layers, and implicit terrain."
---

<figure>
  <img src="{{ '/images/projects/terrain-erosion.jpg' | relative_url }}" alt="Three examples of simulated terrain erosion showing an eroded coast, desert rock formations, and a mountain landscape">
  <figcaption>Coastal, wind, and thermal erosion examples from Hartley et al., <cite>Flexible terrain erosion</cite> (2024).</figcaption>
</figure>

I co-developed a particle-based method for removing, transporting, and depositing material across different terrain representations. The method can use a velocity field from a fluid simulation or one defined by the user, allowing the same erosion model to support different environments and editing workflows. The work received the CGI 2024 Best Student Paper Award.

[Paper and citation]({{ '/publication/Flexible-terrain-erosion' | relative_url }}) · [CGI 2024 presentation]({{ '/talks/flexible-terrain-erosion' | relative_url }})
