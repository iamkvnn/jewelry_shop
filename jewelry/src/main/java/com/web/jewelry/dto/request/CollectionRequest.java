package com.web.jewelry.dto.request;

import lombok.Data;

@Data
public class CollectionRequest {
    private Long id;
    private String name;
    private String description;
}
